import PropTypes, {bool} from 'prop-types';
import React from 'react';
import {
  requireNativeComponent,
  findNodeHandle,
  UIManager,
  Dimensions,
} from 'react-native';
const {width, height} = Dimensions.get('window');
console.log(width, height);
class ZZPlayerView extends React.Component {
  state = {isFullPlay: false};
  render() {
    let style = this.state.isFullPlay
      ? [
          this.props.style,
          {
            height: Dimensions.get('window').width,
          },
        ]
      : this.props.style;
    delete this.props.style;
    return (
      <BRPlayerView
        {...this.props}
        style={style}
        onFullScreen={this._onFullScreen}
      />
    );
  }

  play = () => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this),
      UIManager.getViewManagerConfig('BRPlayerView').Commands.play, // Commands后面的值与原生层定义的HANDLE_METHOD_NAME一致
      null,
    );
  };
  stop = () => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this),
      UIManager.getViewManagerConfig('BRPlayerView').Commands.stop, // Commands后面的值与原生层定义的HANDLE_METHOD_NAME一致
      null,
    );
  };
  pause = () => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this),
      UIManager.getViewManagerConfig('BRPlayerView').Commands.pause, // Commands后面的值与原生层定义的HANDLE_METHOD_NAME一致
      null,
    );
  };
  resume = () => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this),
      UIManager.getViewManagerConfig('BRPlayerView').Commands.resume, // Commands后面的值与原生层定义的HANDLE_METHOD_NAME一致
      null,
    );
  };

  _onFullScreen = event => {
    console.log('event', event);
    this.setState({isFullPlay: event.nativeEvent.isFullPlay});
  };
}

ZZPlayerView.propTypes = {
  url: PropTypes.string,
};

const BRPlayerView = requireNativeComponent('BRPlayerView', ZZPlayerView);

export default ZZPlayerView;
