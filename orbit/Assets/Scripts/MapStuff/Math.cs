using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public static class Math{

    public static float Angle(Vector2 p_vector2)
    {
        if (p_vector2.x < 0)
        {
            return (2 * Mathf.PI) - (Mathf.Atan2(p_vector2.x, p_vector2.y) * -1);
        }
        else
        {
            return Mathf.Atan2(p_vector2.x, p_vector2.y);
        }
    }
    public static Vector2 ToVect(float a)
    {
        return new Vector2(Mathf.Sin(a), Mathf.Cos(a));
    }
}
