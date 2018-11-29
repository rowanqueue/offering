using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;

public class StoryManager : MonoBehaviour {
    public TextAsset inkJSONAsset;
    private Story story;

    float offset;//how much you should move the text down when you spawn
    float offsetDelta;
    float resetOffset;//where offset should be after choice buttons are deleted
    int numChoicesDisplayed;//how many choices you've displayed this scene
    List<GameObject> choicesButtons;
    List<GameObject> screenText;//all text thats been generated so you can scroll it up
    public string currentKnot;//what knot are you currently in

    //constants
    int maxLineLength;

    //parent
    public Transform textPos;

    //prefabs
    public TMP_Text textPrefab;
    public Button buttonPrefab;
    // Use this for initialization
    private void Awake()
    {
        screenText = new List<GameObject>();
        offsetDelta = 20;
        maxLineLength = 44;
        story = new Story(inkJSONAsset.text);
        choicesButtons = new List<GameObject>();
    }

    // Update is called once per frame
    void Update () {
        if (story.canContinue)
        {
            string text = story.Continue().Trim();
            string thisKnot = "";
            foreach (string s in story.currentTags)
            {
                Debug.Log(s);
                if (s[0] == 'k')
                {
                    thisKnot = s.Split('_')[1];
                }
            }
            if(currentKnot == "")
            {
                currentKnot = thisKnot;
            }else if(currentKnot != thisKnot)
            {
                currentKnot = thisKnot;
                ResetScene();
            }
            ViewText(text);
            int numLines  = Mathf.CeilToInt(text.Length / (float)maxLineLength);
            Debug.Log(numLines);
            if(offset < 420)
            {
                offset += offsetDelta*0.75f * numLines;
            }
            else
            {
                foreach(GameObject te in screenText)
                {
                    te.transform.position += new Vector3(0, offsetDelta);
                }
            }
            resetOffset = offset;
        }
        if(story.currentChoices.Count > numChoicesDisplayed)
        {
            Choice choice = story.currentChoices[numChoicesDisplayed];
            Button button = CreateChoice(choice.text.Trim());

            button.onClick.AddListener(delegate { OnClickChoice(choice); });
            numChoicesDisplayed++;
            offset += offsetDelta;
            choicesButtons.Add(button.gameObject);//add buttons to the list
        }
	}
    void ViewText(string text)
    {
        TMP_Text storyText = Instantiate(textPrefab) as TMP_Text;
        storyText.text = text;
        storyText.transform.SetParent(textPos, false);
        storyText.transform.position += new Vector3(0, -offset);
        screenText.Add(storyText.gameObject);

    }
    void OnClickChoice(Choice choice)
    {
        foreach (string s in story.currentTags)
        {
            Debug.Log(s);
        }
        story.ChooseChoiceIndex(choice.index);
        foreach(string s in story.currentTags)
        {
            Debug.Log(s);
        }
        //reset the scene
        foreach(GameObject button in choicesButtons)
        {
            Destroy(button);
        }
        numChoicesDisplayed = 0;
        choicesButtons = new List<GameObject>();
        offset = resetOffset;
    }
    Button CreateChoice(string text)
    {
        Button choice = Instantiate(buttonPrefab) as Button;
        choice.transform.SetParent(textPos, false);
        choice.transform.position += new Vector3(0, -offset);

        TMP_Text choiceText = choice.GetComponent<TMP_Text>();
        choiceText.text = text;
        return choice;
    }
    void ResetScene()
    {
        foreach(GameObject te in screenText)
        {
            Destroy(te);
        }
        screenText = new List<GameObject>();
        offset = 0;
    }
}
