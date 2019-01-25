using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;

public class NewEndCredits : MonoBehaviour {
    public TMP_Text displayText;
    public float speed;
    public TextAsset endCredits;
    float timeCreated;
	// Use this for initialization
	void Start () {
        displayText.text = "";
        string[] split = endCredits.text.Split('\n');
        bool changeNext = true;
        foreach(string s in split)
        {
            if(s[0] == '/')
            {
                break;
            }
            if(s.Trim().Equals(""))
            {
                changeNext = true;
            }
            else
            {
                if(s[0] == '<')
                {
                    changeNext = false;
                }
                if (changeNext)
                {
                    displayText.text += "<size=40>" + s + "</size>";
                    changeNext = false;
                }
                else
                {
                    displayText.text += s;
                }
            }
            displayText.text += "\n";
        }
        timeCreated = Time.time;
	}
	
	// Update is called once per frame
	void Update () {
        //displayText.rectTransform.position += new Vector3(0, speed);
        //displayText.rectTransform.pos
        displayText.rectTransform.anchoredPosition += new Vector2(0, speed);
        //Debug.Log(displayText.transform.position.y);
        if(Time.time > timeCreated+5f && displayText.rectTransform.anchoredPosition.y >= displayText.rectTransform.rect.height + speed*10f)
        {
            SceneManager.LoadScene(0);
        }
	}
}
