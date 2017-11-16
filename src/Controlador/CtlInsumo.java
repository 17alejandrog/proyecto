/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Insumo;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Alejandro
 */
public class CtlInsumo {

    static ArrayList<Insumo> listaInsumo = new ArrayList<Insumo>();

    public boolean registrarInsumo(String nombre, String codigo, String descripcion) {
        int band = 0;
        Insumo insumo = new Insumo(codigo, nombre, descripcion);
        if (listaInsumo.isEmpty()) {
            listaInsumo.add(insumo);
            return true;
        } else {
            for (int i = 0; i < listaInsumo.size(); i++) {
                if ((insumo.getCodigo().equals(listaInsumo.get(i).getCodigo()))) {
                    band = 1;
                }

            }
            if (band == 0) {
                listaInsumo.add(insumo);
                return true;
            } else {
                JOptionPane.showMessageDialog(null, "Ya se encuentra registrado este insumo");
            }
        }
        return false;
    }

    public DefaultTableModel listar() {
        DefaultTableModel modelo = new DefaultTableModel();
        String nombreColumnas[] = {"Codigo", "Nombre", "Direccion"};
        modelo = new DefaultTableModel(new Object[][]{}, nombreColumnas);
        for (int i = 0; i < listaInsumo.size(); i++) {
            modelo.addRow(new Object[]{
                listaInsumo.get(i).getCodigo(),
                listaInsumo.get(i).getNombre(),
                listaInsumo.get(i).getDescripcion()});
        }
        return modelo;
    }

    public Insumo consultarInsumo(String codigo) {
        for (int i = 0; i < listaInsumo.size(); i++) {
            if (listaInsumo.get(i).getCodigo().trim().equals(codigo)) {
                return listaInsumo.get(i);
            }
        }
        return null;
    }

    public DefaultTableModel consultarListar (){
        int encontrado = 0;

        DefaultTableModel modelo = new DefaultTableModel();
        String nombreColumnas[] = {"Codigo", "Nombre", "Descripcion"};
        modelo = new DefaultTableModel(new Object[][]{}, nombreColumnas);
        for (int i = 0; i < listaInsumo.size(); i++) {
           
                modelo.addRow(new Object[]{
                    listaInsumo.get(i).getCodigo(),
                    listaInsumo.get(i).getNombre(),
                    listaInsumo.get(i).getDescripcion()});
               
        }
        if (encontrado == 0) {
        }
        return modelo;
    }

    public boolean modificarInsumo(String codigo, Insumo insumo) {
        for (int i = 0; i < listaInsumo.size(); i++) {
            if (listaInsumo.get(i).getCodigo().equals(insumo.getCodigo())) {
                listaInsumo.remove(i);
                listaInsumo.add(insumo);
                return true;
            }
        }
        return false;
    }

    public boolean eliminarInsumo(String codigo) {
        for (int i = 0; i < listaInsumo.size(); i++) {
            if (listaInsumo.get(i).getCodigo().equals(codigo)) {
                listaInsumo.remove(listaInsumo.get(i));
                return true;
            }
        }
        return false;
    }
}
