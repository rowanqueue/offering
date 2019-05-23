using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ExitGame : MonoBehaviour {
	void Update () {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Application.Quit();
        }
        if (Input.GetKey(KeyCode.R))
        {
            if (Input.GetKeyDown(KeyCode.E))
            {
                SceneManager.LoadScene(0);
            }
        }
        if (Input.GetMouseButton(0) && Input.GetMouseButton(1))
        {
            if (Input.GetMouseButtonDown(2))
            {
                SceneManager.LoadScene(0);
            }

        }
	}
}
