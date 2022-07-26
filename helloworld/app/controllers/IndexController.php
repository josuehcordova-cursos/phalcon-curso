<?php

use Phalcon\Assets\Filters\Cssmin;
use Phalcon\Assets\Filters\Jsmin;

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $this->assets
             ->collection("app.min.css")
             ->setTargetPath("css/app.min.css")
             ->setTargetUri("css/app.min.css")
             ->addCss("css/app.css")
             ->addFilter(new Cssmin());

        $this->assets->collection("app.min.js")
             ->setTargetPath("js/app.min.js")
             ->setTargetUri("js/app.min.js")
             ->addJs("js/app.js")
             ->addFilter(new Jsmin());

        $this->view->msg = "Nuevo mensaje";

        $this->view->setVars([
            "user" => "jhuancapaza",
            "cursos" => [
                    "Curso angular", "Curso php"
            ]
        ]);

        $this->view->users = Users::find();
    }

}

