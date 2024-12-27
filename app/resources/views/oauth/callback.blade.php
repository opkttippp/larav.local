<script>
    window.opener.postMessage({
        user: <?php echo json_encode($user)?>,
        {{--userInfo: <?php echo json_encode($userInfo)?>,--}}
        access_token: "{{$access_token }}",
    })
    window.close();
</script>






