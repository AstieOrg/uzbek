// Add this line(s) to your config file
$CONFIG['admin']['video_ext'] = array('video/mp4');

$CONFIG['admin']['word_ext'] = array('application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/zip', 'application/msword', 'application/octet-stream');
$CONFIG['admin']['xls_ext'] = array('application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/zip', 'application/excel', 'application/vnd.ms-excel', 'application/msexcel');
$CONFIG['admin']['csv_ext'] = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel');
$CONFIG['admin']['pdf_ext'] = array('application/pdf', 'application/x-download');
$CONFIG['admin']['document_ext'] = array_merge($CONFIG['admin']['word_ext'],$CONFIG['admin']['xls_ext'],$CONFIG['admin']['pdf_ext']);