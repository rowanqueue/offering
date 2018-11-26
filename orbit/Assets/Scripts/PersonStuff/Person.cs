using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Person : MonoBehaviour {
    private string nname;//since name is taken by MonoBehaviour
    public string Name
    {
        get
        {
            return nname;
        }
        set
        {
            nname = value;
        }
    }
    public string role;//their job
    public List<int> skills;//0pilot,1marine,2steward,3engineer
    public int happiness;//:)
    public int credits;//how much they cost to hire
    public string origin;//where they are from
    public int age;
    public List<string> history;//potential to check where they've been/done with you
    string destination;//for passengers, where they are going
    string destinationTime;//for passengers, when they want to get there
	// Use this for initialization
	void Start () {
        Generate();
        Global.me.Name(this);
	}
	void Generate()
    {
        skills = new List<int>();
        if(role == null)//if they don't have a role, make them randomly, then assign them a role
        {
            int pilot = Random.Range(0, 10);
            int marine = Random.Range(0, 10);
            int steward = Random.Range(0, 10);
            int engineer = Random.Range(0, 10);
            skills.Add(pilot);
            skills.Add(marine);
            skills.Add(steward);
            skills.Add(engineer);
            int biggest = Mathf.Max(pilot, marine);//basically we're checking what they're best at
            biggest = Mathf.Max(biggest, steward);
            biggest = Mathf.Max(biggest, engineer);
            if(biggest == skills[0])
            {
                role = "Pilot";
            }
            if (biggest == skills[1])
            {
                role = "Marine";
            }
            if (biggest == skills[2])
            {
                role = "Steward";
            }
            if (biggest == skills[3])
            {
                role = "Engineer";
            }
        }
        else//they have a role, so make them best in that
        {
            int pilot = Random.Range(0, 5);
            int marine = Random.Range(0, 5);
            int steward = Random.Range(0, 5);
            int engineer = Random.Range(0, 5);
            if (role == "Pilot")
            {
                pilot = Random.Range(5, 10);
            }
            if (role == "Marine")
            {
                marine = Random.Range(5, 10);
            }
            if (role == "Steward")
            {
                steward = Random.Range(5, 10);
            }
            if (role == "Engineer")
            {
                engineer = Random.Range(5, 10);
            }
            skills.Add(pilot);
            skills.Add(marine);
            skills.Add(steward);
            skills.Add(engineer);
        }
        happiness = Random.Range(30, 70);
        credits = Random.Range(90, 180);
        age = Random.Range(17, 55);
    }
	// Update is called once per frame
	void Update () {
		
	}
}
