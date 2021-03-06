/**
 * VERSION: 12.0
 * DATE: 2012-01-11
 * AS2
 * UPDATES AND DOCS AT: http://www.greensock.com
 **/
import com.greensock.TweenLite;
import com.greensock.plugins.TweenPlugin;
/**
 * <p><strong>See AS3 files for full ASDocs</strong></p>
 * 
 * <p><strong>Copyright 2008-2013, GreenSock. All rights reserved.</strong> This work is subject to the terms in <a href="http://www.greensock.com/terms_of_use.html">http://www.greensock.com/terms_of_use.html</a> or for <a href="http://www.greensock.com/club/">Club GreenSock</a> members, the software agreement that was issued with the membership.</p>
 * 
 * @author Jack Doyle, jack@greensock.com
 */
class com.greensock.plugins.AutoAlphaPlugin extends TweenPlugin {
		public static var API:Number = 2; //If the API/Framework for plugins changes in the future, this number helps determine compatibility
		private var _target:Object;
		private var _ignoreVisible:Boolean;
		
		public function AutoAlphaPlugin() {
			super("autoAlpha,_alpha,_visible");
		}
		
		public function _onInitTween(target:Object, value:Object, tween:TweenLite):Boolean {
			_addTween((_target = target), "_alpha", target._alpha, value);
			return true;
		}
		
		public function _kill(lookup:Object):Boolean {
			_ignoreVisible = lookup.hasOwnProperty("_visible");
			return super._kill(lookup);
		}
		
		public function setRatio(v:Number):Void {
			super.setRatio(v);
			if (!_ignoreVisible) {
				_target._visible = (_target._alpha != 0);
			}
		}
	
}