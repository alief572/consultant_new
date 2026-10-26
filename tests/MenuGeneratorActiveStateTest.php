<?php
// CLI test for Menu_generator active menu detection
if (PHP_SAPI !== 'cli') { exit(1); }

define('BASEPATH', dirname(__DIR__) . '/system/');
define('ENVIRONMENT', 'development');

function log_message($level, $message) {}
function is_php($version) { return version_compare(PHP_VERSION, $version, '>='); }
function show_error($message) { throw new RuntimeException($message); }
function check_class($item = '', $class_only = false) { return ''; }
function site_url($uri = '') { return 'http://localhost:8080/' . ltrim($uri, '/'); }

require dirname(__DIR__) . '/application/config/development/database.php';
$configuration = $db['default'];
require BASEPATH . 'database/DB.php';

$connection = DB($configuration, true);

// Create mock CI controller
class MockCI
{
    public $db;
    public $uri;
    public $input;
    public $auth;
    public $router;
    public $load;

    public function __construct($connection)
    {
        $this->db = $connection;
        $this->uri = new class {
            public $current_uri = 'expense_report_project/verification';
            public function uri_string() { return $this->current_uri; }
        };
        $this->input = new class {
            public function get($key = null) {
                return isset($_GET[$key]) ? $_GET[$key] : null;
            }
        };
        $this->auth = new class {
            public $admin = true;
            public function user_id() { return 1; }
            public function is_admin() { return $this->admin; }
        };
        $this->router = (object) ['class' => 'expense_report_project'];
        $this->load = new class {
            public function helper($name) {}
            public function library($name) {}
        };
    }
}

$mockCi = new MockCI($connection);

function &get_instance()
{
    global $mockCi;
    return $mockCi;
}

require dirname(__DIR__) . '/application/libraries/Menu_generator.php';

$generator = new Menu_generator();

function assert_test($condition, $message)
{
    if (!$condition) {
        throw new RuntimeException("Assertion failed: " . $message);
    }
}

echo "Running MenuGeneratorActiveStateTest...\n";

// Test 1: verification URL
$activeIds = $generator->get_active_menu_ids(1, [], 'expense_report_project/verification');
assert_test(in_array(450, $activeIds), "Approval menu (450) must be active for verification URL");
assert_test(in_array(489, $activeIds), "Verifikasi Pengembalian Kasbon menu (489) must be active for verification URL");
assert_test(!in_array(462, $activeIds), "Project menu (462) must NOT be active for verification URL");
assert_test(!in_array(466, $activeIds), "Expense Report Project (466) must NOT be active for verification URL");
echo "  [PASS] Verification URL only activates Approval and Verifikasi Pengembalian Kasbon\n";

// Test 2: expense report project main list
$activeIds = $generator->get_active_menu_ids(1, [], 'expense_report_project');
assert_test(in_array(462, $activeIds), "Project menu (462) must be active for expense_report_project");
assert_test(in_array(466, $activeIds), "Expense Report Project menu (466) must be active for expense_report_project");
assert_test(!in_array(450, $activeIds), "Approval menu (450) must NOT be active for expense_report_project");
assert_test(!in_array(489, $activeIds), "Verifikasi menu (489) must NOT be active for expense_report_project");
echo "  [PASS] expense_report_project URL only activates Project and Expense Report Project\n";

// Test 3: sub-action under expense report project (e.g. add/edit)
$activeIds = $generator->get_active_menu_ids(1, [], 'expense_report_project/add');
assert_test(in_array(462, $activeIds), "Project menu (462) must be active for expense_report_project/add");
assert_test(in_array(466, $activeIds), "Expense Report Project menu (466) must be active for expense_report_project/add");
assert_test(!in_array(450, $activeIds), "Approval menu (450) must NOT be active for expense_report_project/add");
echo "  [PASS] expense_report_project/add activates Project and Expense Report Project\n";

// Test 4: return_detail with finance=1
$_GET['finance'] = '1';
$activeIds = $generator->get_active_menu_ids(1, [], 'expense_report_project/return_detail');
assert_test(in_array(450, $activeIds), "Approval menu (450) must be active when viewing return_detail with finance=1");
assert_test(in_array(489, $activeIds), "Verifikasi menu (489) must be active when viewing return_detail with finance=1");
assert_test(!in_array(462, $activeIds), "Project menu (462) must NOT be active when viewing return_detail with finance=1");
echo "  [PASS] return_detail with finance=1 correctly maps to Verifikasi Pengembalian Kasbon\n";

// Test 5: return_detail without finance=1 (regular user view)
unset($_GET['finance']);
$activeIds = $generator->get_active_menu_ids(1, [], 'expense_report_project/return_detail');
assert_test(in_array(462, $activeIds), "Project menu (462) must be active for regular user return_detail");
assert_test(in_array(466, $activeIds), "Expense Report Project (466) must be active for regular user return_detail");
assert_test(!in_array(450, $activeIds), "Approval menu (450) must NOT be active for regular user return_detail");
echo "  [PASS] return_detail without finance=1 correctly maps to Expense Report Project\n";

// Test 6: Verify rendered HTML output of build_menus(1) for verification
$mockCi->uri->current_uri = 'expense_report_project/verification';
$html = $generator->build_menus(1);

assert_test(strpos($html, "approval450head active") !== false, "Approval treeview header must have class active");
assert_test(strpos($html, "project462head active") === false, "Project treeview header must NOT have class active");
assert_test(preg_match("/<li class='approval450 active'>\s*<a[^>]*expense_report_project\/verification/i", $html) === 1, "Verifikasi Pengembalian Kasbon li must have class active");
assert_test(preg_match("/<li class='project462 active'>\s*<a[^>]*site_url\('expense_report_project'\)/i", $html) === 0, "Expense Report Project li must NOT have class active");
echo "  [PASS] Rendered HTML correctly expands Approval and leaves Project closed\n";

// Test 7: Verify rendered HTML output of build_menus(1) for expense_report_project
$mockCi->uri->current_uri = 'expense_report_project';
$html = $generator->build_menus(1);

assert_test(strpos($html, "project462head active") !== false, "Project treeview header must have class active for expense_report_project");
assert_test(strpos($html, "approval450head active") === false, "Approval treeview header must NOT have class active for expense_report_project");
assert_test(preg_match("/<li class='project462 active'>\s*<a[^>]*expense_report_project/i", $html) === 1, "Expense Report Project li must have class active");
assert_test(preg_match("/<li class='approval450 active'>\s*<a[^>]*expense_report_project\/verification/i", $html) === 0, "Verifikasi Pengembalian Kasbon li must NOT have class active");
echo "  [PASS] Rendered HTML correctly expands Project and leaves Approval closed\n";

// Test 8: Non-admin permission check
$mockCi->auth->admin = false;
$generatorNonAdmin = new Menu_generator();
$activeIds = $generatorNonAdmin->get_active_menu_ids(1, [1853], 'expense_report_project/verification'); // 1853 is permission for verification
assert_test(in_array(489, $activeIds), "Authorized user can activate verification menu");
$activeIdsNoPerm = $generatorNonAdmin->get_active_menu_ids(1, [99999], 'expense_report_project/verification');
assert_test(!in_array(489, $activeIdsNoPerm), "Unauthorized user cannot activate verification menu");
echo "  [PASS] Permission filtering is properly enforced for non-admin users\n";

echo "All menu active state tests passed successfully!\n";
