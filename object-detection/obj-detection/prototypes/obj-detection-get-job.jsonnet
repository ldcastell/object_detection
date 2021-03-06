// @apiVersion 0.1
// @name io.ksonnet.pkg.obj-detection
// @description K8s get data from remote url job
// @shortDescription A K8s job to get data from remote url
// @param name string Name to give to each of the components
// @param pvc string Name of the PVC
// @param mountPath string Path to mount the PVC
// @param url string Remote URL where the data is located

local k = import "k.libsonnet";
local obj_detection = import "ldcastell/obj-detection/obj-detection.libsonnet";

local namespace = env.namespace;
local jobName = import 'param://name';
local pvc = import 'param://pvc';
local url = import 'param://url';
local mountPath = import 'param://mountPath';

std.prune(k.core.v1.list.new(obj_detection.get_data_job(namespace, jobName, pvc, url, mountPath)))
