using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Scroll : MonoBehaviour {
    ScrollRect rect;
	// Use this for initialization
	void Start () {
        rect = GetComponent<ScrollRect>();
	}
	
	// Update is called once per frame
	void Update () {
        rect.verticalNormalizedPosition = 0;
	}
}
