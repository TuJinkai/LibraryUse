/**
 * Created by liuu on 2016/12/1.
 */
Validator = {
    Require : /.+/,
    Email : /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
    Phone : /^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}$/,
    Mobile : /^((\(\d{3}\))|(\d{3}\-))?13\d{9}$/,
    Url : /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
    IdCard : /^\d{15}(\d{2}[A-Za-z0-9])?$/,
    Currency : /^\d+(\.\d+)?$/,
    Number : /^\d+$/,
    Zip : /^[1-9]\d{5}$/,
    QQ : /^[1-9]\d{4,8}$/,
    Integer : /^[-\+]?\d+$/,
    Double : /^[-\+]?\d+(\.\d+)?$/,
    English : /^[A-Za-z]+$/,
    Chinese :  /^[\u0391-\uFFE5]+$/,
    UnSafe : /^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/,
    IsSafe : function(str){return !this.UnSafe.test(str);},
    SafeString : "this.IsSafe(value)",
    Limit : "this.limit(value.length,getAttribute('min'),  getAttribute('max'))",
    LimitB : "this.limit(this.LenB(value), getAttribute('min'), getAttribute('max'))",
    Date : "this.IsDate(value, getAttribute('min'), getAttribute('format'))",
    Repeat : "value == document.getElementsByName(getAttribute('to'))[0].value",
    Range : "getAttribute('min') < value && value < getAttribute('max')",
    Compare : "this.compare(value,getAttribute('operator'),getAttribute('to'))",
    Custom : "this.Exec(value, getAttribute('regexp'))",
    Group : "this.MustChecked(getAttribute('name'), getAttribute('min'), getAttribute('max'))",
    ErrorItem : [document.forms[0]],
    ErrorMessage : ["以下原因导致注册失败：\t\t\t\t"],
    Validate : function(theForm, mode){
        var obj = theForm || event.srcElement;
        var count = obj.elements.length;
        this.ErrorMessage.length = 1;
        this.ErrorItem.length = 1;
        this.ErrorItem[0] = obj;
        for(var i=0;i<count;i++){
            with(obj.elements[i]){
                var _dataType = getAttribute("dataType");
                if(typeof(_dataType) == "object" || typeof(this[_dataType]) == "undefined")  continue;
                this.ClearState(obj.elements[i]);
                if(getAttribute("require") == "false" && value == "") continue;
                switch(_dataType){
                    case "Date" :
                    case "Repeat" :
                    case "SafeString" :
                        if(!eval(this[_dataType]))	{
                            this.AddError(i, getAttribute("msg"));
                        }
                        break;
                    default :
                        if(!this[_dataType].test(value)){
                            this.AddError(i, getAttribute("msg"));
                        }
                        break;
                }
            }
        }
        if(this.ErrorMessage.length > 1){
            mode = mode || 1;
            var errCount = this.ErrorItem.length;
            switch(mode){
                case 2 :
                    for(var i=1;i<errCount;i++)
                        this.ErrorItem[i].style.color = "red";
                case 1 :
                    alert(this.ErrorMessage.join("\n"));
                    this.ErrorItem[1].focus();
                    break;
                case 3 :
                    for(var i=1;i<errCount;i++){
                        try{
                            var span = document.createElement("SPAN");
                            span.id = "__ErrorMessagePanel";
                            span.style.color = "red";
                            this.ErrorItem[i].parentNode.appendChild(span);
                            span.innerHTML = this.ErrorMessage[i].replace(/\d+:/,"*");
                        }
                        catch(e){alert(e.description);}
                    }
                    this.ErrorItem[1].focus();
                    break;
                default :
                    alert(this.ErrorMessage.join("\n"));
                    break;
            }
            return false;
        }
        return true;
    },
    ClearState : function(elem){
        with(elem){
            if(style.color == "red")
                style.color = "";
            var lastNode = parentNode.childNodes[parentNode.childNodes.length-1];
            if(lastNode.id == "__ErrorMessagePanel")
                parentNode.removeChild(lastNode);
        }
    },
    AddError : function(index, str){
        this.ErrorItem[this.ErrorItem.length] = this.ErrorItem[0].elements[index];
        this.ErrorMessage[this.ErrorMessage.length] = this.ErrorMessage.length + ":" + str;
    },
}