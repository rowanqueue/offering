using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Orbit : MonoBehaviour {
    public Transform subject;
    public float currad;
    public float speed;
    public float angvelocity = 0.8f;
    private float RotateSpeed = 0.01f;
    public float _angle;
    public Vector2 realdirection;
    int direction;
    float distance;
    // Use this for initialization
    void Start () {
        //_angle = Math.Angle((transform.position - subject.transform.position));
        _angle = _angle * Mathf.Deg2Rad;
        Move();
        direction = 1;
        RotateSpeed = direction * angvelocity / (subject.transform.position - transform.position).magnitude;
    }
	
	// Update is called once per frame
	public void Move () {
        _angle = _angle % (Mathf.PI * 2);
        currad = (subject.transform.position - transform.position).magnitude;
        //float rad = ((Vector2)subject.transform.position - point).magnitude;
        RotateSpeed = direction * angvelocity / currad;
        Vector2 oldposition = transform.position;
        _angle += RotateSpeed * 0.0166667f;
        var offset = new Vector2(Mathf.Sin(_angle), Mathf.Cos(_angle)) * currad;
        //Debug.Log(currad);
        transform.position = (Vector2)subject.transform.position + offset;
        realdirection = (Vector2)transform.position - oldposition;
        if(transform.name == "SOI:Earth")
        {
            //Debug.Log(currad);
        }
    }
}
