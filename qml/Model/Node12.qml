import QtQuick
import QtQuick3D

Node {
    // Materials
    DefaultMaterial {
        id: defaultMaterial_material
        //diffuseColor: "#ff999999"
        diffuseMap: Texture {
            source: "file:///C:/Users/pasha/Downloads/Pistol_BaseColor.png"
        }
    }
    DefaultMaterial {
        id: blinn13SG_material
        diffuseMap: Texture {
            source: "file:///C:/Users/pasha/Downloads/Pistol_BaseColor.png"
        }
    }
    // end of Materials

    Node {
        id: node12_obj
        Node {
            id: default_
        }
        Model {
            id: lP_Part_06_LP_Bake
            source: "file:///D:/projects/pia/qml/Model/meshes/lP_Part_06_LP_Bake.mesh"
            materials: [
                blinn13SG_material
            ]
        }
        Node {
            id: default__1
        }
        Model {
            id: lP_Bake_LP_Part_04
            source: "file:///D:/projects/pia/qml/Model/meshes/lP_Bake_LP_Part_04.mesh"
            materials: [
                blinn13SG_material
            ]
        }
        Node {
            id: default__2
        }
        Model {
            id: lP_Bake_LP_Part_01
            source: "file:///D:/projects/pia/qml/Model/meshes/lP_Bake_LP_Part_01.mesh"
            materials: [
                blinn13SG_material
            ]
        }
        Node {
            id: default__3
        }
        Model {
            id: lP_Bake_LP_Part_03
            //y: 7
            source: "file:///D:/projects/pia/qml/Model/meshes/lP_Bake_LP_Part_03.mesh"
            materials: [
                blinn13SG_material
            ]
        }
        Node {
            id: default__4
        }
        Model {
            id: lP_Bake_LP_Part_05
            source: "file:///D:/projects/pia/qml/Model/meshes/lP_Bake_LP_Part_05.mesh"
            materials: [
                blinn13SG_material
            ]
        }
        Node {
            id: default__5
        }
        Model {
            id: lP_Bake_LP_Part_02
            //x: -2
            source: "file:///D:/projects/pia/qml/Model/meshes/lP_Bake_LP_Part_02.mesh"
            materials: [
                blinn13SG_material
            ]
        }
    }
}
