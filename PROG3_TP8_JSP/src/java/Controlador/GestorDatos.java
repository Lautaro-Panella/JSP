/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Conexion.DataBase;
import Modelo.ObjetoReporte;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hp
 */
public class GestorDatos {
    
    DataBase db = new DataBase();
    Connection conexion = db.estableceConexion();
    
    public List<String> dameRegiones() {
        ResultSet rs = null;
        String region = null;
        List<String> regiones = new ArrayList<>();
        try {
            // Se crea un Statement para realizar la consulta.
            Statement s = conexion.createStatement();
            rs = s.executeQuery("SELECT DISTINCT Region FROM country");
            while (rs.next()) {
                region = rs.getString("Region");
                regiones.add(region);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return regiones;
    }
    
    public List<ObjetoReporte> dameObjetosReporte(String pais, String region) {
        ResultSet rs = null;
        ObjetoReporte or = null;
        List<ObjetoReporte> objetos = new ArrayList<>();
        try {
            // Se crea un Statement para realizar la consulta.
            Statement s = conexion.createStatement();
            rs = s.executeQuery("SELECT ciudad.name cityName, ciudad.population, pais.name countryName, pais.region FROM city ciudad INNER JOIN country pais ON ciudad.CountryCode = pais.code WHERE pais.region = '"+region+"' AND pais.name LIKE '%"+pais+"%' ORDER BY pais.name");
            while (rs.next()) {
                or = new ObjetoReporte();
                or.setCiudad(rs.getString("cityName"));
                or.setPoblacion(rs.getInt("Population"));
                or.setPais(rs.getString("countryName"));
                or.setRegion(rs.getString("Region"));
                objetos.add(or);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return objetos;
    }
    
    public void cierraConexion() {
        try {
            conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
