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

;%SGSAVE^INT^1^59547,73891^0
%SGSAVE ;;04:43 PM  19 Nov 1993; 19 Nov 93  4:28 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SAVE() D MEMX^%QCAMEM
 S %0=$ZP(^[QUI]SVGDE(""))
 S %0=%0+1
 D SAVGLO
 Q %0
SAVGLO N GLO,A,O,%A,%O
 F GLO="^TEMPORAI","^SAVVARX" D COPY^%QCAGLC(GLO_"("_$J_")","^[QUI]SVGDE("_%0_",""GLOBJ"","""_GLO_""")")
 F GLO="^[QUI]TEMPORAI" D COPY^%QCAGLC(GLO,"^[QUI]SVGDE("_%0_",""GLOB"","""_GLO_""")")
 S A="" F %A=0:0 S A=$$NXTRIA^%QSTRUC8("%",$J,A) Q:A=""  S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8("%",$J,A,O) Q:O=""  S ^[QUI]SVGDE(%0,"ATTEMP",A,O)=$$VALEUR^%QSTRUC8("%",$J,A,O)
 Q
 
SAVEPCT() 
 S %0=$ZP(^[QUI]SVGDE(""))
 S %0=%0+1
 D SAVGLO2
 Q %0
SAVGLO2 N GLO,A,O,%A,%O
 F GLO="CXT" D COPY^%QCAGLC(GLO,"^[QUI]SVGDE("_%0_",""GLOB"","""_GLO_""")")
 S A="" F %A=0:0 S A=$$NXTRIA^%QSTRUC8("%",$J,A) Q:A=""  S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8("%",$J,A,O) Q:O=""  S ^[QUI]SVGDE(%0,"ATTEMP",A,O)=$$VALEUR^%QSTRUC8("%",$J,A,O)
 Q
 
RESTORE(NUM) 
 D RESGLO
 D RMEMX^%QCAMEM
 Q
RESTPCT(NUM) 
 D RESGLO
 Q
 
RESGLO 
 N GLO,%G,A,%A,O,%O
 S GLO="" F %G=0:0 S GLO=$O(^[QUI]SVGDE(NUM,"GLOBJ",GLO)) Q:GLO=""  D COPY^%QCAGLC("^[QUI]SVGDE("_NUM_",""GLOBJ"","""_GLO_""")",GLO_"("_$J_")")
 S GLO="" F %G=0:0 S GLO=$O(^[QUI]SVGDE(NUM,"GLOB",GLO)) Q:GLO=""  D COPY^%QCAGLC("^[QUI]SVGDE("_NUM_",""GLOB"","""_GLO_""")",GLO)
 S A="" F %A=0:0 S A=$O(^[QUI]SVGDE(NUM,"ATTEMP",A)) Q:A=""  S O="" F %O=0:0 S O=$O(^[QUI]SVGDE(NUM,"ATTEMP",A,O)) Q:O=""  D PA^%QSGESTI("%",$J,A,^[QUI]SVGDE(NUM,"ATTEMP",A,O),O)
 Q
 ;

