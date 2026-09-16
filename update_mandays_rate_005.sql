-- Update Mandays Rate untuk penawaran 005/STM//IX/26
-- Perhitungan: (154,400,000 - 27,200,000 - 1,040,000 - 16,000,000) / 31 mandays = 110,160,000 / 31 = 3,553,548.39

UPDATE kons_tr_penawaran 
SET mandays_rate = 3553548.39 
WHERE id_quotation = '005/STM//IX/26';
