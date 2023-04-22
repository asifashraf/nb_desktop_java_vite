module com.notebull.nb {
    requires javafx.controls;
    requires javafx.fxml;
    requires javafx.graphics;
    requires javafx.base;


    opens com.notebull.nb to javafx.fxml;
    exports com.notebull.nb;
}