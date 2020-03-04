import 'dart:html';

Element get title => _buildTitle();

Element _buildTitle() {  
    final Element title = Element.p()
      ..text = '@PLUGFOX'
      ..style.cssText = 'font-size: 5vw;';
    final Element titleContainer = Element.div()
      ..style.cssText = 'position:absolute;text-align:center;margin:0;top:50%;left:50%;transform:translate(-50%,-50%);'
      ..append(title);
    return titleContainer;
}