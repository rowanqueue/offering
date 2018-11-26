using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//checks which stations the player can go to and displays lines to them
public class DistanceCheck : MonoBehaviour
{
    public float distance; //max distance a player can make in one jump
    public Station playerStation;//station the player is in
    public List<LineRenderer> starLines = new List<LineRenderer>();//the lines between stations that only display if the player can fly to them
    public List<Station> stations = new List<Station>();//all the nearby stations
    CircleCollider2D collider;
    // Use this for initialization
    void Awake()
    {
        collider = GetComponent<CircleCollider2D>();
        distance = Global.me.ship.maxDistance;
        playerStation = Global.me.ship.curStation;
        collider.radius = distance + 1.0f;//has to be slightly bigger bcecause the distance is floored to an int
        foreach (Transform child in transform)
        {
            starLines.Add(child.GetComponent<LineRenderer>());
        }
        CheckNearby();
        DrawStarLines();
    }

    // Update is called once per frame
    void Update()
    {
        if(distance != Global.me.ship.maxDistance)//only change maxdistance when the player's max distance changes
        {
            distance = Global.me.ship.maxDistance;
            collider.radius = distance+1.0f;//has to be slightly bigger bcecause the distance is floored to an int
            CheckNearby();//now that it is different, need to check nearby again
        }
        if (playerStation != Global.me.ship.curStation)//fires when player leaves and when player arrives
        {
            playerStation = Global.me.ship.curStation;
            CheckNearby();//checks again
            if (playerStation != null)//if player is at a station, draw all lines possible
            {
                DrawStarLines();
            }
            else//if player is flying, draw the starline they are on
            {
                DrawYourStarLine();
            }
        }
    }
    void DrawStarLines()
    {
        if (stations.Count > starLines.Count)
        {
            MakeMoreStarLines(stations.Count);//if you don't have enough to display, make more
        }
        int num = 0;
        foreach(Station station in stations)
        {
            LineRenderer starline = starLines[num];
            starline.SetPosition(0, playerStation.transform.position);
            starline.SetPosition(1, station.transform.position);
            if (Mathf.FloorToInt(Vector2.Distance(starline.GetPosition(0), starline.GetPosition(1))) > distance)//too far? get rid of it
            {
                starline.SetPosition(0, Vector2.zero);
                starline.SetPosition(1, Vector2.zero);
            }
            num++;
        }
    }
    void DrawYourStarLine()//draw the star line the player is using
    {
        foreach(LineRenderer starline in starLines)
        {
            if(starline.GetPosition(1) != Global.me.ship.destination.transform.position)
            {
                starline.SetPosition(0, Vector2.zero);
                starline.SetPosition(1, Vector2.zero);
            }
        }
    }
    void MakeMoreStarLines(int num)
    {
        for(int n = num-starLines.Count; n > 0; n--)
        {
            GameObject starLine = Instantiate(Resources.Load("StarLine"), transform) as GameObject;
            starLines.Add(starLine.GetComponent<LineRenderer>());
        }
    }
    void CheckNearby()
    {
        stations.Clear();
        Collider2D[] nearStations = new Collider2D[10];
        ContactFilter2D filter = new ContactFilter2D();
        filter.useTriggers = true;
        int num = collider.OverlapCollider(filter, nearStations);
        foreach (Collider2D colliderA in nearStations)
        {
            if (colliderA != null)
            {
                Station station = colliderA.gameObject.GetComponent<Station>();
                if (station != null)
                {
                    if (stations.Contains(station) == false)
                    {
                        stations.Add(station);
                    }
                }
            }
        }
    }
}
