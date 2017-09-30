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

;%SDTX22^INT^1^59547,73890^0
SDTX22 ;;
 ;;^[QUI]SDSYMBC(2,6,3)=S AA=10
 ;;^[QUI]SDSYMBC(2,6,4)=S OA=26
 ;;^[QUI]SDSYMBC(2,6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(2,7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(2,7,1)=S AD=10
 ;;^[QUI]SDSYMBC(2,7,2)=S OD=26
 ;;^[QUI]SDSYMBC(2,7,3)=S AA=4
 ;;^[QUI]SDSYMBC(2,7,4)=S OA=19
 ;;^[QUI]SDSYMBC(2,7,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(3,1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(3,1,1)=S AD=4
 ;;^[QUI]SDSYMBC(3,1,2)=S OD=2
 ;;^[QUI]SDSYMBC(3,1,3)=S AA=8
 ;;^[QUI]SDSYMBC(3,1,4)=S OA=-0
 ;;^[QUI]SDSYMBC(3,1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(3,2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(3,2,1)=S AD=8
 ;;^[QUI]SDSYMBC(3,2,2)=S OD=-0
 ;;^[QUI]SDSYMBC(3,2,3)=S AA=19
 ;;^[QUI]SDSYMBC(3,2,4)=S OA=-0
 ;;^[QUI]SDSYMBC(3,2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(3,3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(3,3,1)=S AD=19
 ;;^[QUI]SDSYMBC(3,3,2)=S OD=-0
 ;;^[QUI]SDSYMBC(3,3,3)=S AA=23
 ;;^[QUI]SDSYMBC(3,3,4)=S OA=4
 ;;^[QUI]SDSYMBC(3,3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(3,4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(3,4,1)=S AD=23
 ;;^[QUI]SDSYMBC(3,4,2)=S OD=4
 ;;^[QUI]SDSYMBC(3,4,3)=S AA=23
 ;;^[QUI]SDSYMBC(3,4,4)=S OA=9
 ;;^[QUI]SDSYMBC(3,4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(3,5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(3,5,1)=S AD=23
 ;;^[QUI]SDSYMBC(3,5,2)=S OD=9
 ;;^[QUI]SDSYMBC(3,5,3)=S AA=19
 ;;^[QUI]SDSYMBC(3,5,4)=S OA=13
 ;;^[QUI]SDSYMBC(3,5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(3,6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(3,6,1)=S AD=19
 ;;^[QUI]SDSYMBC(3,6,2)=S OD=13
 ;;^[QUI]SDSYMBC(3,6,3)=S AA=23
 ;;^[QUI]SDSYMBC(3,6,4)=S OA=17
 ;;^[QUI]SDSYMBC(3,6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(3,7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(3,7,1)=S AD=23
 ;;^[QUI]SDSYMBC(3,7,2)=S OD=17
 ;;^[QUI]SDSYMBC(3,7,3)=S AA=23
 ;;^[QUI]SDSYMBC(3,7,4)=S OA=23
 ;;^[QUI]SDSYMBC(3,7,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(3,8,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(3,8,1)=S AD=23
 ;;^[QUI]SDSYMBC(3,8,2)=S OD=23
 ;;^[QUI]SDSYMBC(3,8,3)=S AA=19
 ;;^[QUI]SDSYMBC(3,8,4)=S OA=27
 ;;^[QUI]SDSYMBC(3,8,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(3,9,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(3,9,1)=S AD=19
 ;;^[QUI]SDSYMBC(3,9,2)=S OD=27
 ;;^[QUI]SDSYMBC(3,9,3)=S AA=8
 ;;^[QUI]SDSYMBC(3,9,4)=S OA=27
 ;;^[QUI]SDSYMBC(3,9,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(3,10,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(3,10,1)=S AD=8
 ;;^[QUI]SDSYMBC(3,10,2)=S OD=27
 ;;^[QUI]SDSYMBC(3,10,3)=S AA=4
 ;;^[QUI]SDSYMBC(3,10,4)=S OA=25
 ;;^[QUI]SDSYMBC(3,10,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(4,5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(4,5,1)=S AD=14
 ;;^[QUI]SDSYMBC(4,5,2)=S OD=-0
 ;;^[QUI]SDSYMBC(4,5,3)=S AA=14
 ;;^[QUI]SDSYMBC(4,5,4)=S OA=27
 ;;^[QUI]SDSYMBC(4,5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC(4,6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC(4,6,1)=S AD=14
 ;;^[QUI]SDSYMBC(4,6,2)=S OD=27
 ;;^[QUI]SDSYMBC(4,6,3)=S AA=4
 ;;^[QUI]SDSYMBC(4,6,4)=S OA=13
 ;;^[QUI]SDSYMBC(4,6,5)=X ^%ENVIRON("SD","TRAIT")

