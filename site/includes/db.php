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

    public function validateLogin($email, $password) {
        $valid = True;

        if (empty($email) || empty($password)) {
            return "Email and password are required.";
        }
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $valid = false;
        }
        if (strlen($password) < 8 || !preg_match("/[A-Z]/", $password) || !preg_match("/[a-z]/", $password) || !preg_match("/[0-9]/", $password) || !preg_match("/[^A-Za-z0-9]/", $password)) {
            $valid = false;
        }

        if (!$valid) {
            return "Invalid email or password.";
        }
        return $valid;
    }

    public function login($UID, $Session) {
        $this->query("INSERT INTO Sessions (UserID, Session) VALUES ($UID, '$Session')");
    }

    public function logout($Session) {
        $this->query("DELETE FROM Sessions WHERE Session = '$Session'");
    }

    public function isLoggedIn($Session) {
        $sessions = $this->query("SELECT * FROM Sessions WHERE Session = '$Session'");
        if (count($sessions) > 0) {
            return $sessions[0]['UserID'];
        }
        return False;
    }

    public function getSession($session) {
        $sessions = $this->query("SELECT * FROM Sessions WHERE Session = '$session'");
        
        if (count($sessions) == 0) {
            return False;
        }

        $ses = $sessions[0];
        if(count($sessions) > 1) {
            $this -> query("DELETE FROM Sessions WHERE Session = '$session'");
            $this -> query("INSERT INTO Sessions (Session, UserID) VALUES ('$session', " . $ses['UserID'] . ")");
        }
        return $ses;
    }

    public function userFromEmail($email){
        $usr = $this -> query("SELECT * FROM admin WHERE Email = '$email'");
        if (count($usr) == 0) {
            return False;
        }
        $usr = $usr[0];
        return $usr;
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