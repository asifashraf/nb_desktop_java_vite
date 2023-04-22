module com.notebull.nb {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.notebull.nb to javafx.fxml;
    exports com.notebull.nb;
}