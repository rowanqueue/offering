using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class StartMenu : MonoBehaviour {
    public void Begin()
    {
        SceneManager.LoadScene("main");
    }
    public void Quit()
    {
        Application.Quit();
    }
}
