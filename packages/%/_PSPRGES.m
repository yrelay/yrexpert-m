;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%PSPRGES^INT^1^59547,73874^0
%PSPRGES ;;02:37 PM  30 Sep 1993; 30 Sep 93 12:16 PM ; 30 Sep 93  1:49 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
EXIPRED(PRED) 
 D SIGNAL(PRED)
 Q $D(^[QUI]RQSGLO("PRED",PRED))
 
SUPP(PRED) K ^[QUI]RQSGLO("PRED",PRED),^[QUI]RQSDON("PRED",PRED)
 D SX^%QSGESTK("TRAITEMENT","p."_PRED)
 Q
 
COMPIL(PRED,VISU) 
 N GLODEF,GLORES,RES
 D SIGNAL(PRED)
 S GLODEF="^[QUI]RQSGLO(""PRED"","""_PRED_""")"
 S GLORES="^[QUI]RQSDON(""COMPPRED"","""_PRED_""")"
 S RES=$$COMPELEM^%TLOCMP(GLODEF,GLORES,VISU)
 Q RES
 
ANALYSE(PR) 
 N RES
 D SIGNAL(PR)
 S RES=$$ANAONE^%PSPRSA1(PR)
 S:RES RES=$$COMPIL(PR,0)
 Q RES
 
CREER(PRED) 
 Q
 
SIGNAL(PRED) 
 N X,MSG
 I $D(^[QUI]RQSGLO("PRED",PRED)),'($$IR^%QSGE5("TRAITEMENT","p."_PRED)) S X=$$CREER^%QSGEIND("TRAITEMENT","p."_PRED,"",1,.MSG)
 Q
 
 
 
MAJ 
 N PR,%P,PRED,X,MSG
 S PR="p." F %P=0:0 S PR=$$NXTRI^%QSTRUC8("TRAITEMENT",PR) Q:PR=""  Q:$E(PR,1,2)'="p."  I '($D(^[QUI]RQSGLO("PRED",$E(PR,3,$L(PR))))) D SX^%QSGESTK("TRAITEMENT",PR)
 S PRED="" F %P=0:0 S PRED=$O(^[QUI]RQSGLO("PRED",PRED)) Q:PRED=""  I '($$IR^%QSGE5("TRAITEMENT","p."_PRED)) S X=$$CREER^%QSGEIND("TRAITEMENT","p."_PRED,"",1,.MSG)
 Q

