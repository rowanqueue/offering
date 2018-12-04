using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class Tile : MonoBehaviour {
    public Choice choice;
    public BoxCollider bc;
    private void Awake()
    {
        bc = GetComponent<BoxCollider>();
    }
}
