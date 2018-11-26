using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraDragger : MonoBehaviour {

    public bool beingUsed = false;
    public Vector3 resetCamera; // original camera position
    private Vector3 origin; // place where mouse is first pressed
    private Vector3 difference; // change in position of mouse relative to origin

    void Start()
    {
        resetCamera = Camera.main.transform.position;
    }
    void LateUpdate()
    {
        if (beingUsed)
        {
            if (Input.GetMouseButtonDown(0))
            {
                origin = MousePos();
            }

            if (Input.GetMouseButton(0))
            {
                difference = MousePos() - transform.position;
                transform.position = origin - difference;
            }

            if (Input.GetMouseButton(1)) // reset camera to original position
            {
                transform.position = resetCamera;
            }
            /*if(Input.GetAxis("Mouse ScrollWheel") >0)
            {
                Camera.main.orthographicSize = Mathf.Max(Camera.main.orthographicSize - 7, 7);
            }
            if (Input.GetAxis("Mouse ScrollWheel")<0)
            {
                Camera.main.orthographicSize = Camera.main.orthographicSize + 7;
            }*/
        }
    }

    // return the position of the mouse in world coordinates (helper method)
    Vector3 MousePos()
    {
        return Camera.main.ScreenToWorldPoint(Input.mousePosition);
    }
}
