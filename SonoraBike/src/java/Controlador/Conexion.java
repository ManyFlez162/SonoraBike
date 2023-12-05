package Controlador;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Brandon Figueroa Ugalde - 00000233295
 * @author Manuel Francisco Flores Velazquez - 00000233301
 */
public class Conexion {
    private String USERNAME="root";
    private String PASSWORD="";
    private String HOST="localhost";
    private String PORT="3307";
    private String DATEBASE="sonorabike";
    private String CLASSNAME="com.mysql.jdbc.Driver";
    private String URL="jdbc:mysql://"+HOST+":"+PORT+"/"+DATEBASE;
    private Connection con;
    
    public Conexion(){
        try{
            Class.forName(CLASSNAME);
            con=DriverManager.getConnection(URL,USERNAME,PASSWORD);            
        }catch(ClassNotFoundException e){
            System.err.println("Error en: "+e);
        }catch(SQLException e){
            System.err.println("Error en: "+e);
        }
    }
    
    public Connection getConexion() throws SQLException{
        con=DriverManager.getConnection(URL,USERNAME,PASSWORD);  
        return con;
    }
    
}
