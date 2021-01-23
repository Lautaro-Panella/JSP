/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Conexion.DataBase;
import Modelo.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hp
 */
public class PersonaGestor {
    
    DataBase db = new DataBase();
    Connection conexion = db.estableceConexion();
    
    public void insertarPersona(int dni, String nombre, String domicilio) {
        try {
            PreparedStatement ps = conexion.prepareStatement("INSERT INTO persona (dni, nombre, domicilio) VALUES (?, ?, ?)");
            // Se establecen los parámetros y se ejecuta la sentencia.
            ps.setInt(1, dni);
            ps.setString(2, nombre);
            ps.setString(3, domicilio);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<Persona> dameListaPersonas() {
        ResultSet rs = null;
        Persona p1 = new Persona();
        List<Persona> personas = new ArrayList<>();
        try {
            // Se crea un Statement para realizar la consulta.
            Statement s = conexion.createStatement();
            rs = s.executeQuery("SELECT * FROM persona");
            while (rs.next()) {
                p1 = new Persona();
                p1.setDni(rs.getInt("dni"));
                p1.setNombre(rs.getString("nombre"));
                p1.setDomicilio(rs.getString("domicilio"));
                personas.add(p1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return personas;
    }
    public void cierraConexion() {
        try {
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
