<?php

class BobDemo {

    const DB_HOST = 'localhost';
    const DB_NAME = 'test';
    const DB_USER = 'root';
    const DB_PASSWORD = '';

    /**
     * PDO instance
     * @var PDO 
     */
    private $pdo = null;

    /**
     * Open the database connection
     */
    public function __construct() {
        // open database connection
        $conStr = sprintf("mysql:host=%s;dbname=%s;charset=utf8", self::DB_HOST, self::DB_NAME);

        try {
            $this->pdo = new PDO($conStr, self::DB_USER, self::DB_PASSWORD);
            //for prior PHP 5.3.6
            //$conn->exec("set names utf8");
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

    /**
     * insert blob into the files table
     * @param string $filePath
     * @param string $mime mimetype
     * @return bool
     */
    public function insertBlob($filePath, $mime) {
        $blob = fopen($filePath, 'rb');

        $sql = "INSERT INTO pdf(MIME,FILE) VALUES(:mime,:data)";
        $stmt = $this->pdo->prepare($sql);

        $stmt->bindParam(':mime', $mime);
        $stmt->bindParam(':data', $blob, PDO::PARAM_LOB);

        return $stmt->execute();
    }

    /**
     * update the files table with the new blob from the file specified
     * by the filepath
     * @param int $id
     * @param string $filePath
     * @param string $mime
     * @return bool
     */
    // function updateBlob($id, $filePath, $mime) {

    //     $blob = fopen($filePath, 'rb');

    //     $sql = "UPDATE files
    //             SET mime = :mime,
    //                 data = :data
    //             WHERE id = :id;";

    //     $stmt = $this->pdo->prepare($sql);

    //     $stmt->bindParam(':mime', $mime);
    //     $stmt->bindParam(':data', $blob, PDO::PARAM_LOB);
    //     $stmt->bindParam(':id', $id);

    //     return $stmt->execute();
    // }

    /**
     * select data from the the files
     * @param int $id
     * @return array contains mime type and BLOB data
     */
    public function selectBlob($id) {

        $sql = "SELECT mime,
                        file
                   FROM pdf
                  WHERE split_file_id = :id;";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(array(":id" => $id));
        $stmt->bindColumn(1, $mime);
        $stmt->bindColumn(2, $data, PDO::PARAM_LOB);

        $stmt->fetch(PDO::FETCH_BOUND);

        return array("mime" => $mime,
            "data" => $data);
    }

    /**
     * close the database connection
     */
    public function __destruct() {
        // close the database connection
        $this->pdo = null;
    }

}


//Fetching the field data from the form such as split range and file name;

$splitrange=$_POST["splitrange"];


// Splitting the pdf and storing it as its filename.zip

require_once('../php/vendor/autoload.php');
use Ilovepdf\Ilovepdf;
use Ilovepdf\SplitTask;


$myTask = new SplitTask('project_public_027fefb232a996ab3aa6a0c86f7b22f1_3H80d639980b85d76a3a0349444d37a12f3f8',
    'secret_key_30d7f905a45dcd5d583cbe8e6dde4d81_xoRI8fa32755ce9a308026538bd577a61cb21');

//Give the filename of imported dataset

$fileName='cs';
$wholeDataset = $fileName.'.pdf';
$pathWholeDataset=pathinfo(realpath($wholeDataset), PATHINFO_DIRNAME);
$file = $myTask->addFile($pathWholeDataset.'\\'.$wholeDataset);
$myTask->setFixedRange($splitrange);
$myTask->setPackagedFilename($fileName);
$myTask->setOutputFilename($fileName);
$myTask->execute();
$myTask->download();


//Unzipping the zipped file 

$file = $fileName.'.zip';
$path = pathinfo(realpath($file), PATHINFO_DIRNAME);
$zip = new ZipArchive;
$res = $zip->open($file);
if ($res === TRUE) {
  $zip->extractTo('./'.$fileName.'/');
  $zip->close();
}


//Fetching all the splitted files from unzipped folder and storing them in the database.

$dir= $path.'\\'.$fileName;
$files1 = scandir($dir);
$scanned_directory = array_diff(scandir($dir), array('..', '.'));
for($i=2;$i<sizeof($scanned_directory);$i++){   
    $blobObj = new BobDemo();
    $blobObj->insertBlob($dir."\\".$scanned_directory[$i],"application/pdf");
}
 echo "Files are splitted and stored.
?>