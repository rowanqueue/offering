using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TurnOffGrid : MonoBehaviour {

    public Image background;
    private void Awake()
    {
        gameObject.SetActive(false);
        background.sprite = null;
    }
}
