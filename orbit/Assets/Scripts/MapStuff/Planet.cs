using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Planet : Thing {
    public bool established = false;
    public float radius;
    public float gravity;
    public CircleCollider2D ground;
    // Use this for initialization
    void Start () {
        ground = transform.GetComponent<CircleCollider2D>();
        if (established == false)
        {
            GeneratePlanet();
        }
    }
	
	// Update is called once per frame
	void FixedUpdate () {
        if (ground.radius != radius && radius != 0)
        {
            ChangeRadius();
        }
    }
    void ChangeRadius()
    {
        float ratio = (radius / ground.radius);
        transform.GetChild(0).localScale = transform.GetChild(0).localScale * ratio;
        ground.radius = radius;

    }
    void GeneratePlanet()
    {
        radius = Random.Range(1, 4);
        float density = Random.Range(3, 7);
        density = density / 5;
        if (radius == 1)
        {
            mass = 250 * density;
        }
        else if (radius == 2)
        {
            mass = 500 * density;
        }
        else if (radius == 3)
        {
            mass = 1000 * density;
        }
        else if (radius == 4)
        {
            mass = 1500 * density;
        }
        if (transform.name == "Planet (549)")
        {
            mass = 1700;
        }
        int colorpicker = Random.Range(1, 8);
        Color color = Color.grey;
        if (colorpicker == 1)
        {
            color = Color.blue;
        }
        else if (colorpicker == 2)
        {
            color = Color.green;
        }
        else if (colorpicker == 3)
        {
            color = Color.yellow;
        }
        else if (colorpicker == 4)
        {
            color = Color.magenta;
        }
        else if (colorpicker == 5)
        {
            color = Color.cyan;
        }
        else
        {
            color = Color.grey;
        }
        /*transform.GetChild(0).GetComponent<SpriteRenderer>().color = color;
        transform.GetChild(0).GetComponent<TrailRenderer>().startColor = color;
        transform.GetChild(0).GetComponent<TrailRenderer>().endColor = new Color(color.r, color.g, color.b, 0);
        transform.GetChild(0).GetComponent<TrailRenderer>().startWidth = radius * 1.8f;
        transform.GetChild(0).GetComponent<TrailRenderer>().time += radius;*/
        ChangeRadius();
    }
}
