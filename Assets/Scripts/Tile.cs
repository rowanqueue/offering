using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Ink.Runtime;

public class Tile : MonoBehaviour {
    public Choice choice;
    public BoxCollider bc;
    public SpriteRenderer sr;
    public ParticleSystem ps;
    private void Awake()
    {
        bc = GetComponent<BoxCollider>();
        sr = GetComponentInChildren<SpriteRenderer>();
        sr.color = Color.clear;
        ps = GetComponentInChildren<ParticleSystem>();
        //ps = Instantiate(Resources.Load("Particle/StarParticle"), transform) as ParticleSystem;

    }
}
