<?php
include_once "config.php";
$config = Config::get('db');
class DB {
    public $db;
    private $host;
    private $username;
    private $password;
    private $database;
    private $conn;

    public function __construct() {
        global $config;
        $this->host = $config['host'];
        $this->username = $config['username'];
        $this->password = $config['password'];
        $this->database = $config['database'];
        $this->connect();
    }

    private function connect() {
        try {
            $this->conn = new PDO("mysql:host=$this->host;dbname=$this->database", $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch(PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

    public function query($sql) {
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProjects() {
        $projects = $this->query("SELECT
            p.ID AS ID,
            p.Name AS Name,
            p.Description AS Description,
            p.ImgDir AS ImgDir,
            p.Link AS Link,
            p.GHLink AS GHLink,
            p.Date AS Date,
            p.UpdateDate AS UpdateDate,
            CONCAT('[', 
                GROUP_CONCAT(
                    DISTINCT CONCAT('{\"ID\":', l.ID, ',',
                        '\"Name\":\"', l.Name, '\",',
                        '\"Color\":\"', l.Color, '\"'
                    , '}') SEPARATOR ',')
            , ']') AS PLanguages,
            CONCAT('[', 
                GROUP_CONCAT(
                    DISTINCT CONCAT('{\"ID\":', t.ID, ',',
                        '\"Name\":\"', t.Name, '\",',
                        '\"Color\":\"', t.Color, '\"'
                    , '}') SEPARATOR ',')
            , ']') AS Tags,
            CONCAT('[', 
                GROUP_CONCAT(
                    DISTINCT CONCAT('{\"ID\":', c.ID, ',',
                        '\"Name\":\"', c.Name, '\",',
                        '\"Website\":\"', c.Website, '\",',
                        '\"ImgDir\":\"', c.ImgDir, '\",',
                        '\"Color\":\"', c.Color, '\"'
                    , '}') SEPARATOR ',')
            , ']') AS Collaborators
            FROM
                Projects p
            LEFT JOIN
                Project_PLanguages pl ON p.ID = pl.ProjectID
            LEFT JOIN
                PLanguages l ON pl.LangID = l.ID
            LEFT JOIN
                Project_Tags pt ON p.ID = pt.ProjectID
            LEFT JOIN
                Tags t ON pt.TagID = t.ID
            LEFT JOIN
                Project_Collaborators pc ON p.ID = pc.ProjectID
            LEFT JOIN
                Collaborators c ON pc.CollaboratorID = c.ID
            GROUP BY
                p.ID
            ORDER BY
                p.Date DESC;
        ");
        foreach($projects as $key => $project) {
            $projects[$key]['PLanguages'] = json_decode($project['PLanguages']);
            $projects[$key]['Tags'] = json_decode($project['Tags']);
            $projects[$key]['Collaborators'] = json_decode($project['Collaborators']);
        }
        return (object)$projects;
    }
}