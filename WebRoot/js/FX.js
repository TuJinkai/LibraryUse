/**
 * Created by liuu on 2016/12/13.
 */
function showDiv(open)
{
    document.getElementById("area").style.display=open?"":"none";
}
function hideDiv()
{
    document.getElementById("area").style.display="none";
}
function mouseMove(e)
{
    var o = document.getElementById("area");
    o.style.left = mousePos(e).x-170;
    o.style.top = mousePos(e).y;
}
function mousePos(e)
{
    var x,y;
    var e = e||window.event;
    return {
        x:e.clientX+document.body.scrollLeft+document.documentElement.scrollLeft,
        y:e.clientY+document.body.scrollTop+document.documentElement.scrollTop
    };
};