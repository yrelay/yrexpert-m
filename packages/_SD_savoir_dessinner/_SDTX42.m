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

;%SDTX42^INT^1^59547,73890^0
SDTX42 ;;
 ;;^[QUI]SDSYMBC("g",8,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("g",9,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("g",9,1)=S AD=8
 ;;^[QUI]SDSYMBC("g",9,2)=S OD=-14
 ;;^[QUI]SDSYMBC("g",9,3)=S AA=6
 ;;^[QUI]SDSYMBC("g",9,4)=S OA=-12
 ;;^[QUI]SDSYMBC("g",9,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("h",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("h",1,1)=S AD=6
 ;;^[QUI]SDSYMBC("h",1,2)=S OD=27
 ;;^[QUI]SDSYMBC("h",1,3)=S AA=6
 ;;^[QUI]SDSYMBC("h",1,4)=S OA=-0
 ;;^[QUI]SDSYMBC("h",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("h",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("h",2,1)=S AD=6
 ;;^[QUI]SDSYMBC("h",2,2)=S OD=13
 ;;^[QUI]SDSYMBC("h",2,3)=S AA=17
 ;;^[QUI]SDSYMBC("h",2,4)=S OA=13
 ;;^[QUI]SDSYMBC("h",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("h",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("h",3,1)=S AD=17
 ;;^[QUI]SDSYMBC("h",3,2)=S OD=13
 ;;^[QUI]SDSYMBC("h",3,3)=S AA=21
 ;;^[QUI]SDSYMBC("h",3,4)=S OA=9
 ;;^[QUI]SDSYMBC("h",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("h",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("h",4,1)=S AD=21
 ;;^[QUI]SDSYMBC("h",4,2)=S OD=9
 ;;^[QUI]SDSYMBC("h",4,3)=S AA=21
 ;;^[QUI]SDSYMBC("h",4,4)=S OA=-0
 ;;^[QUI]SDSYMBC("h",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("i",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("i",1,1)=S AD=14
 ;;^[QUI]SDSYMBC("i",1,2)=S OD=13
 ;;^[QUI]SDSYMBC("i",1,3)=S AA=14
 ;;^[QUI]SDSYMBC("i",1,4)=S OA=-0
 ;;^[QUI]SDSYMBC("i",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("i",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("i",2,1)=S AD=12
 ;;^[QUI]SDSYMBC("i",2,2)=S OD=-0
 ;;^[QUI]SDSYMBC("i",2,3)=S AA=15
 ;;^[QUI]SDSYMBC("i",2,4)=S OA=-0
 ;;^[QUI]SDSYMBC("i",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("i",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("i",3,1)=S AD=15
 ;;^[QUI]SDSYMBC("i",3,2)=S OD=13
 ;;^[QUI]SDSYMBC("i",3,3)=S AA=12
 ;;^[QUI]SDSYMBC("i",3,4)=S OA=13
 ;;^[QUI]SDSYMBC("i",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("j",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("j",1,1)=S AD=14
 ;;^[QUI]SDSYMBC("j",1,2)=S OD=13
 ;;^[QUI]SDSYMBC("j",1,3)=S AA=14
 ;;^[QUI]SDSYMBC("j",1,4)=S OA=-10
 ;;^[QUI]SDSYMBC("j",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("j",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("j",2,1)=S AD=14
 ;;^[QUI]SDSYMBC("j",2,2)=S OD=-10
 ;;^[QUI]SDSYMBC("j",2,3)=S AA=12
 ;;^[QUI]SDSYMBC("j",2,4)=S OA=-14
 ;;^[QUI]SDSYMBC("j",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("j",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("j",3,1)=S AD=12
 ;;^[QUI]SDSYMBC("j",3,2)=S OD=-14
 ;;^[QUI]SDSYMBC("j",3,3)=S AA=8
 ;;^[QUI]SDSYMBC("j",3,4)=S OA=-14
 ;;^[QUI]SDSYMBC("j",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("j",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("j",4,1)=S AD=8
 ;;^[QUI]SDSYMBC("j",4,2)=S OD=-14
 ;;^[QUI]SDSYMBC("j",4,3)=S AA=6
 ;;^[QUI]SDSYMBC("j",4,4)=S OA=-10
 ;;^[QUI]SDSYMBC("j",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("j",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("j",5,1)=S AD=12
 ;;^[QUI]SDSYMBC("j",5,2)=S OD=13
 ;;^[QUI]SDSYMBC("j",5,3)=S AA=15
 ;;^[QUI]SDSYMBC("j",5,4)=S OA=13
 ;;^[QUI]SDSYMBC("j",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("k",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("k",1,1)=S AD=6

