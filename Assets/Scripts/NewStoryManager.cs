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

    //tiles
    public Transform tileParent;
    Tile[][] tiles;

    //typing stuff
    public TMP_Text displayText;
    public bool typing;//whether you're typing out a line or not
    public string whatToType;
    public float typeSpeed;
    float lastTypedTimed;//last time you typed something

    //constant
    float maxChoiceOffset;//the furthest the choice offset can go
    Dictionary<string, int> letterToNum;
	void Awake () {
        letterToNum = new Dictionary<string, int>{{ "A",1 },{ "B",2 },{ "C",3 },{ "D",4 },{ "E",5 },{ "F",6 },{ "G",7 },{ "H",8 },{ "I",9 },{ "J",10 }};
        story = new Story(inkJSONAsset.text);
        GetTiles();
        foreach(Button button in choicesButtons)
        {
            button.gameObject.SetActive(false);
        }
        ResetScene();
    }
	void GetTiles()//puts all the tiles into one 2d array
    {
        tiles = new Tile[10][];
        int i = 0;
        foreach(Transform child in tileParent)
        {
            Tile[] row = new Tile[10];
            row[0] = child.GetComponent<Tile>();
            int j = 1;
            foreach(Transform grandChild in child)
            {
                row[j] = grandChild.GetComponent<Tile>();
                j++;
            }
            tiles[i] = row;
            i++;
        }
    }
	void Update () {
        //choices
		if(story.currentChoices.Count > numChoicesDisplayed && typing == false)
        {
            Choice choice = story.currentChoices[numChoicesDisplayed];
            //TODO:  we'll checck for special choices here
            //Debug.Log(numChoicesDisplayed - numSpecialChoices);
            Button button = choicesButtons[numChoicesDisplayed - numSpecialChoices];
            button.gameObject.SetActive(true);
            string choiceText = choice.text.Trim();
            if (choiceText.Contains("^"))
            {
                string[] allText = choiceText.Split('^');
                for(int i = 0; i < allText.Length; i++)
                {
                    string s = allText[i].Trim();
                    if(s == "")
                    {
                        continue;
                    }
                    if(i == allText.Length - 1)//last one
                    {
                        choiceText = s;
                        break;
                    }
                    Debug.Log(s);
                    if (s.Contains(":"))//range of values
                    {
                        string[] rangeText = s.Split(',');
                        //all -1s are bc the tile grid is 1-10, tile array is 0-9
                        //this gets the ranges and parses them into int[]s
                        int[] xRange = new int[2] { letterToNum[rangeText[0].Split(':')[0]]-1, letterToNum[rangeText[0].Split(':')[1]]-1};
                        int[] yRange = new int[2] {int.Parse(rangeText[1].Split(':')[0])-1,int.Parse(rangeText[1].Split(':')[1])-1 };
                        Debug.Log(xRange[0] + ":" + xRange[1] + ',' + yRange[0] + ":" + yRange[1]);
                        for(int j = yRange[0]; j <= yRange[1]; j++)
                        {
                            for(int h = xRange[0];h<= xRange[1]; h++)
                            {
                                SetTile(new int[2] { j, h }, choice);
                            }
                        }
                    }
                    else//single block
                    {
                        string[] posText = s.Split(',');
                        //subtract 1 from numbers bc tile grid is from 1-10, tile array is from 0-9
                        int x = letterToNum[posText[0].ToUpper()] - 1;
                        int y = int.Parse(posText[1]) - 1;
                        SetTile(new int[2] { x, y }, choice);
                    }
                }
            }
            SetChoice(choiceText, button);
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
                Debug.Log(whatToType);
                displayText.text += whatToType[0];
                //audio
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
        foreach(Tile[] tileList in tiles)
        {
            foreach(Tile tile in tileList)
            {
                tile.bc.enabled = false;
            }
        }
    }

    //sets tile to active and following specific choice
    void SetTile(int[] pos, Choice choice)
    {
        Tile tile = tiles[pos[0]][pos[1]];
        tile.choice = choice;
        tile.bc.enabled = true;
    }
}
