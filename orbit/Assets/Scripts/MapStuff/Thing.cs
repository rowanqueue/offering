using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//something that is capable of orbitting
public class Thing : MonoBehaviour{
    public float mass;
    public Rigidbody2D rb;
    public Vector2 vel;
    public Orbit orbit;
    public bool inorbit;
	// Use this for initialization
	void Start () {
        rb = transform.GetComponent<Rigidbody2D>();
        // rb.velocity = vel;
        inorbit = true;
        orbit = transform.GetComponent<Orbit>();
    }
	
	// Update is called once per frame
	void Update () {

	}

}
