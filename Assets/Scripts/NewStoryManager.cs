using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;

public class NewStoryManager : MonoBehaviour {
    public TextAsset inkJSONAsset;
    private Story story;

    float choiceOffset;//how much the choices should move down
    int numChoicesDisplayed;//how many choices you've displayed this scene
    int numSpecialChoices;//how many non-text choices you have
    public List<Button> choicesButtons;
    public string currentKnot;

    //typing stuff
    public TMP_Text displayText;
    public bool typing;//whether you're typing out a line or not
    public string whatToType;
    public float typeSpeed;
    float lastTypedTimed;//last time you typed something

    //constant
    float maxChoiceOffset;//the furthest the choice offset can go

	void Awake () {
        story = new Story(inkJSONAsset.text);
        foreach(Button button in choicesButtons)
        {
            button.gameObject.SetActive(false);
        }
	}
	
	void Update () {
        //choices
		if(story.currentChoices.Count > numChoicesDisplayed && typing == false)
        {
            Choice choice = story.currentChoices[numChoicesDisplayed];
            //TODO:  we'll checck for special choices here
            Debug.Log(numChoicesDisplayed - numSpecialChoices);
            Button button = choicesButtons[numChoicesDisplayed - numSpecialChoices];
            button.gameObject.SetActive(true);
            SetChoice(choice.text.Trim(), button);
            button.onClick.AddListener(delegate { OnClickChoice(choice); });
            numChoicesDisplayed++;
        }

        //text
        if(story.canContinue && typing == false)
        {
            typing = true;
            whatToType = story.Continue().Trim();
            //checking knots!!
            string thisKnot = "";//to check if this is a new knot or not
            foreach(string s in story.currentTags)
            {
                if(s[0] == 'k')
                {
                    thisKnot = s.Split('_')[1];
                }
            }
            if(currentKnot == "")//first knot
            {
                currentKnot = thisKnot;
            }else if(currentKnot != thisKnot)//changes knots
            {
                currentKnot = thisKnot;
                //this is where you could reset the scene
            }
            //done checking knots!!
        }
        //typing
        if (typing)
        {
            if(Time.time > lastTypedTimed + typeSpeed)
            {
                lastTypedTimed = Time.time;
                displayText.text += whatToType[0];
                if(whatToType.Length > 1)//keep on typing
                {
                    whatToType = whatToType.Substring(1);
                }
                else//finish typing this chunk
                {
                    displayText.text += "\n \n";//paragraph break (makes an empty line after it)
                    whatToType = "";
                    typing = false;
                }
            }
            if (Input.GetMouseButtonDown(0))//click to skip
            {
                displayText.text += whatToType;
                displayText.text += "\n \n";
                typing = false;
                whatToType = "";
            }
        }
	}
    void SetChoice(string text, Button button)
    {
        TMP_Text choiceText = button.GetComponent<TMP_Text>();
        choiceText.text = text;
    }
    void OnClickChoice(Choice choice)//what actually happens when a choice is chosen
    {
        story.ChooseChoiceIndex(choice.index);
        ResetScene();

    }
    void ResetScene()
    {
        numChoicesDisplayed = 0;
        foreach(Button choice in choicesButtons)
        {
            choice.onClick.RemoveAllListeners();
            choice.gameObject.SetActive(false);
        }
    }
}
