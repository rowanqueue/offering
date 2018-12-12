using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Fading : MonoBehaviour {
    // StartCoroutine(Coroutines.DoOverEasedTime(LENGTH_OF_TIME_IN_SECONDS, EASING_FUNCTION, t =>
    Color transparent;
    Color reg;
    Color black;
    // Use this for initialization
    void Start() {
        StartCoroutine(Coroutines.DoOverEasedTime(3, Easing.Linear, t =>
        {
            Color.Lerp(Color.white, Color.clear, t);
        }));
    }

    // Update is called once per frame
    void Update () {
		
	}
}
