using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;

public class NewStoryManager : MonoBehaviour {
    public string cheatJump;//put knot here
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
    public string currentSpeaker;//when "", just typing noises
    public ScrollRect scrollRect;

    //sound shit
    AudioSource ambience;
    AudioSource music;

    public Image displayImage;

    //constant
    float maxChoiceOffset;//the furthest the choice offset can go
    Dictionary<string, int> letterToNum;
    Dictionary<string, string> speakerToColor;
	void Awake () {
        ambience = transform.GetChild(0).GetComponent<AudioSource>();
        music = transform.GetChild(1).GetComponent<AudioSource>();
        letterToNum = new Dictionary<string, int>{{ "A",1 },{ "B",2 },{ "C",3 },{ "D",4 },{ "E",5 },{ "F",6 },{ "G",7 },{ "H",8 },{ "I",9 },{ "J",10 }};
        speakerToColor = new Dictionary<string, string>
        {
            {"kari","#b18829ff" },
            {"mom", "#a783afff" },
            {"dad", "#869b63ff" },
            {"grandpa","#dd503eff" },
            {"player", "#86c6ceff" }
        };
        story = new Story(inkJSONAsset.text);
        GetTiles();
        foreach(Button button in choicesButtons)
        {
            button.gameObject.SetActive(false);
        }
        ResetScene();
        if(cheatJump != "")
        {
            story.ChoosePathString(cheatJump);
        }
    }
	void GetTiles()//puts all the tiles into one 2d array
    {
        tiles = new Tile[10][];
        for(int i = 0;i< tileParent.childCount; i++)
        {
            Transform child = tileParent.GetChild(i);
            Tile[] row = new Tile[10];
            row[0] = child.GetComponent<Tile>();
            for(int j = 1; j < child.childCount; j++)
            {
                Transform grandChild = child.GetChild(j);
                row[j] = grandChild.GetComponent<Tile>();
            }
            tiles[i] = row;
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
            string choiceText = choice.text.Trim();
            //grid choice?
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
                                SetTile(new int[2] { h, j }, choice);
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
                numSpecialChoices++;
            }
            else
            {
                button.gameObject.SetActive(true);
                SetChoice(choiceText, button);
                button.onClick.AddListener(delegate { OnClickChoice(choice); });
            }
            numChoicesDisplayed++;
        }

        //text
        if(story.canContinue && typing == false)
        {
            scrollRect.verticalNormalizedPosition = 0;
            typing = true;
            whatToType = story.Continue().Trim();
            //checking knots!!
            string thisKnot = "";//to check if this is a new knot or not
            foreach(string s in story.currentTags)
            {
                if(s[0] == 'v')//visual!!
                {
                    thisKnot = s.Split('_')[1].Trim();
                }
                if(s[0] == 's')//sound?
                {
                    string[] split = s.Split('_');
                    AudioSource source = ambience;
                    if(split.Length == 3)//has a special tag
                    {
                        switch (split[2][0])
                        {
                            case 'm':
                                source = music;
                                break;
                            case 's':
                                //implement later!!
                                source = ambience;
                                break;
                        }
                    }

                    string audioFile = split[1].Trim();
                    switch (audioFile)
                    {
                        case "stop":
                            source.Stop();
                            break;
                        case "volumeUp":
                            source.volume += 0.25f;
                            break;
                        case "volumeDown":
                            source.volume -= 0.25f;
                            break;
                        case "reset":
                            source.volume = 0.5f;
                            break;
                        default:
                            source.clip = Resources.Load<AudioClip>(s.Split('_')[1].Trim());
                            source.Play();
                            break;
                    }
                    /*
                    string audioFile = s.Split('_')[1].Trim();
                    if(audioFile == "stop")
                    {
                        audioLoop.Stop();
                    }
                    else
                    {
                        audioLoop.clip = Resources.Load<AudioClip>(s.Split('_')[1].Trim());
                        audioLoop.Play();
                    }*/
                }
                if(s[0] == 't')//text command!!
                {
                    string textCommand = s.Split('_')[1].Trim();
                    switch (textCommand)
                    {
                        case "speedUp":
                            typeSpeed *= 0.5f;
                            break;
                        case "speedDown":
                            typeSpeed *= 2f;
                            break;
                        case "reset":
                            typeSpeed = 0.05f;
                            break;
                    }
                }
            }
            if(currentKnot != thisKnot && thisKnot != "")//changes knots
            {
                currentKnot = thisKnot;
                //this is where you could reset the scene
                displayText.text = "";
                displayImage.sprite = Resources.Load<Sprite>(currentKnot);
            }
            //done checking knots!!
            //get rid of fake tags to make grid work
            if (whatToType.Contains("^"))
            {
                string[] split = whatToType.Split('^');
                whatToType = split[split.Length - 1];
                if(whatToType.Length <= 0)
                {
                    typing = false;
                }
            }
            //check for current voice (either typing sound or specific voice
            if (whatToType.Length > 0 && whatToType[0] == ':')
            {
                string[] split = whatToType.Split(':');
                currentSpeaker = split[1];
                Debug.Log(currentSpeaker);
                Debug.Log(split.Length);
                if(split.Length >= 4)
                {
                    whatToType = split[2] + ':' + split[3];
                }
                else
                {
                    Debug.Log("YOU FUCKED UP THE INK");
                    whatToType = split[2];
                }
                displayText.text += "<color=" + speakerToColor[currentSpeaker] + "></color>";
            }
            else { currentSpeaker = ""; }
        }
        //typing
        if (typing)
        {
            displayText.color = Color.white;
            if (Time.time > lastTypedTimed + typeSpeed)
            {
                lastTypedTimed = Time.time;
                //audio
                if (whatToType[0] == ' ' || whatToType[0] == '\n')
                {
                    //TextSound.me.PlaySound(currentSpeaker);
                }
                else
                {
                    TextSound.me.PlaySound(currentSpeaker);
                }
                if (whatToType[0] == ':')//change in speaker
                {
                    if(currentSpeaker != "")//speaker is done
                    {
                        currentSpeaker = "";
                        whatToType = whatToType.Substring(1);
                    }
                    else//new speaker
                    {
                        string[] split = whatToType.Split(':');
                        currentSpeaker = split[1];
                        if (split.Length >= 4)
                        {
                            whatToType = split[2] + ':' + split[3];
                        }
                        else
                        {
                            Debug.Log("YOU FUCKED UP THE INK");
                            whatToType = split[2];
                        }
                        displayText.text += "<color=" + speakerToColor[currentSpeaker] + "></color>";
                    }
                }
                if (currentSpeaker != "")
                {
                    displayText.text = displayText.text.Insert(displayText.text.Length - 8, whatToType[0].ToString());
                }
                else if(whatToType.Length >= 1)
                {
                    displayText.text += whatToType[0];
                }
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
                int dieLine = -1;//when hit this, start printing again
                for (int i = 0; i < whatToType.Length; i++)
                {
                    char c = whatToType[i];
                    if (i < dieLine)
                    {
                        continue;
                    }
                    if (c == ':')
                    {
                        Debug.Log(whatToType.Substring(i));
                        if (currentSpeaker != "")//someone is done talking
                        {
                            currentSpeaker = "";
                            continue;
                        }
                        else//new person is talking now
                        {
                            string check = whatToType.Substring(i);//only check whats at i or past it
                            string[] split = check.Split(':');
                            currentSpeaker = split[1];
                            Debug.Log(currentSpeaker);
                            Debug.Log(split.Length);
                            if (split.Length < 4)
                            {
                                Debug.Log("YOU FUCKED UP THE INK");
                            }
                            else
                            {
                                dieLine = i + currentSpeaker.Length+2;
                            }
                            displayText.text += "<color=" + speakerToColor[currentSpeaker] + "></color>";
                        }
                    }
                    else
                    {
                        if (currentSpeaker != "")
                        {
                            displayText.text = displayText.text.Insert(displayText.text.Length - 8, c.ToString());
                        }
                        else
                        {
                            displayText.text += c;
                        }
                    }
                }
                displayText.text += "\n \n";
                typing = false;
                whatToType = "";
                TextSound.me.PlaySound(currentSpeaker);
            }
            scrollRect.verticalNormalizedPosition = 0;
        }
        else//looking for a choice?
        {
            if(numSpecialChoices > 0)
            {
                displayText.color = Color.grey;
            }
            else
            {
                displayText.color = Color.white;
            }
            //see if you're hovering over anything
            RaycastHit hit;
            Choice hoveredChoice = null;
            if (Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out hit))
            {
                Tile tile = hit.collider.GetComponent<Tile>();
                if (tile != null)
                {
                    hoveredChoice = tile.choice;
                }
            }
            foreach (Tile[] tileList in tiles)
            {
                foreach (Tile tile in tileList)
                {
                    if(hoveredChoice != null)
                    {
                        if (tile.choice == hoveredChoice)
                        {
                            tile.sr.color = Color.white;
                        }
                        else
                        {
                            tile.sr.color = Color.clear;
                        }
                    }
                    else
                    {
                        tile.sr.color = Color.clear;
                    }
                }
            }
            if (hoveredChoice != null && Input.GetMouseButtonDown(0))//SELECT CHOICE!!
            {
                OnClickChoice(hoveredChoice);
                TextSound.me.PlaySound(currentSpeaker);
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
        numSpecialChoices = 0;
        numChoicesDisplayed = 0;
        foreach(Button choice in choicesButtons)
        {
            choice.onClick.RemoveAllListeners();
            choice.gameObject.SetActive(false);
        }
        int i = 0;
        foreach(Tile[] tileList in tiles)
        {
            int j = 0;
            foreach(Tile tile in tileList)
            {
                tile.sr.enabled = false;
                tile.bc.enabled = false;
                j++;
            }
            i++;
        }
    }

    //sets tile to active and following specific choice
    void SetTile(int[] pos, Choice choice)
    {
        Tile tile = tiles[pos[1]][pos[0]];
        tile.choice = choice;
        tile.bc.enabled = true;
        tile.sr.enabled = true;
        tile.sr.color = Color.clear;
    }
}
