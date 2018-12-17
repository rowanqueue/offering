using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TextSound : MonoBehaviour {
    public static TextSound me;
    public AudioClip typeSound;
    public Dictionary<string, List<AudioClip>> speakerToVoice;
    public List<AudioClip> smorbleVoice;
    public List<AudioClip> momVoice;
    public List<AudioClip> cowLadyVoice;
    public List<AudioClip> dadVoice;
    public List<AudioClip> kariVoice;
    public List<AudioClip> sw1Voice;
    public List<AudioClip> sw2Voice;
    public List<AudioClip> grandpaVoice;
	// Use this for initialization
	void Awake () {
        me = this;
        speakerToVoice = new Dictionary<string, List<AudioClip>>
        {
            {"player",smorbleVoice},
            {"mom",momVoice },
            {"audie",cowLadyVoice },
            {"dad",dadVoice },
            {"kari",kariVoice },
            {"grandpa",grandpaVoice },
            {"brynja",sw1Voice },
            {"asta",sw2Voice },
            {"",new List<AudioClip>(){typeSound} }
        };
	}
    public void PlaySound(string speaker)
    {
        AudioClip clip = typeSound;
        //until everyone has a voice, use smorble's
        if (speakerToVoice.ContainsKey(speaker))
        {
            clip = speakerToVoice[speaker][Random.Range(0, speakerToVoice[speaker].Count)];
        }

        AudioManager.me.PlaySound(clip);
    }

}
