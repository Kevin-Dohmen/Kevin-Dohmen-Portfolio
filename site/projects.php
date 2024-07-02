<?php
include_once "includes/header.php";

$DB = new DB();

$projects = $DB->getProjects();

?>

<div id="Header">
    <p class="Title">Projecten</p>
</div>

<div id="content">
    <div id="contentbox">
        <div id="projectsDiv">
            <?php
            foreach ($projects as $project) {
                $tagshtml = '';

                if ($project["PLanguages"] != null){
                    foreach ($project["PLanguages"] as $language) {
                        $tagshtml .= '<div class="lable languages" style="background-color: ' . $language->Color . '">' . $language->Name . '</div>';
                    }
                }

                if ($project["Tags"] != null){
                    foreach ($project["Tags"] as $tag) {
                        $tagshtml .= '<div class="lable tags" style="background-color: ' . $tag->Color . '">' . $tag->Name . '</div>';
                    }
                }

                $html = '
                <div class="projectbox">
                    <img src="img/projects/' . $project['ImgDir'] . '" alt="Pic" width="200px" class="projectpic" onclick="window.open(\'' . $project['Link'] . '\', \'_blank\')">
                    <div class="projecttextbox">
                        ' . $tagshtml . '
                        <h3>
                            ' . $project['Name'] . ' (' . date('M-Y', strtotime($project['Date'])) . ')
                        </h3>
                        <p>
                            ' . $project['Description'] . '
                        </p>
                        <a href="' . $project['GHLink'] . '" target="_blank"><img src="img/githubLogoWhite.webp" alt="github" height="32px"></a>
                    </div>
                </div>
                ';

                echo $html;
            }
            ?>
        </div>
    </div>
</div>

<?php
include_once "includes/footer.php";
?>