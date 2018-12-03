using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TurnOffGrid : MonoBehaviour {

    private void Awake()
    {
        gameObject.SetActive(false);
    }
}
