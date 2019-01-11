using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TextSound : MonoBehaviour {
    public static TextSound me;
    public AudioClip typeSound;
    public List<string> characters;
    public Dictionary<string, List<AudioClip>> speakerToVoice;
	// Use this for initialization
	void Awake () {
        me = this;
        speakerToVoice = new Dictionary<string, List<AudioClip>>
        {
            {"",new List<AudioClip>(){typeSound} }
        };
	}
    public void AddCharacter(string character, string filePosition)
    {
        AudioClip[] voiceArr = Resources.LoadAll<AudioClip>(filePosition + character);
        List<AudioClip> voice = new List<AudioClip>();
        foreach (AudioClip clip in voiceArr)
        {
            voice.Add(clip);
        }
        speakerToVoice.Add(character, voice);
        characters.Add(character);
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
