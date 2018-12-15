using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TextSound : MonoBehaviour {
    public static TextSound me;
    public AudioClip typeSound;
    public Dictionary<string, List<AudioClip>> speakerToVoice;
    public List<AudioClip> smorbleVoice;
	// Use this for initialization
	void Awake () {
        me = this;
        speakerToVoice = new Dictionary<string, List<AudioClip>>
        {
            {"player",smorbleVoice},
            {"",new List<AudioClip>(){typeSound} }
        };
	}
    public void PlaySound(string speaker)
    {
        AudioClip clip = typeSound;
        //until everyone has a voice, use smorble's
        if(speaker != "")
        {
            speaker = "player";
        }
        if (speakerToVoice.ContainsKey(speaker))
        {
            clip = speakerToVoice[speaker][Random.Range(0, speakerToVoice[speaker].Count)];
        }

        AudioManager.me.PlaySound(clip);
    }

}
