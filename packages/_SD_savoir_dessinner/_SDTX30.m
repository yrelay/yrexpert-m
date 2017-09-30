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

;%SDTX30^INT^1^59547,73890^0
SDTX30 ;;
 ;;^[QUI]SDSYMBC("D",11,3)=S AA=14
 ;;^[QUI]SDSYMBC("D",11,4)=S OA=-0
 ;;^[QUI]SDSYMBC("D",11,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("D",12,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("D",12,1)=S AD=14
 ;;^[QUI]SDSYMBC("D",12,2)=S OD=-0
 ;;^[QUI]SDSYMBC("D",12,3)=S AA=0
 ;;^[QUI]SDSYMBC("D",12,4)=S OA=-0
 ;;^[QUI]SDSYMBC("D",12,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("DEGRE",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("DEGRE",5,1)=S AD=4
 ;;^[QUI]SDSYMBC("DEGRE",5,2)=S OD=23
 ;;^[QUI]SDSYMBC("DEGRE",5,3)=S R=$$DISTANCE^%PBCACV(4,23,4,25)
 ;;^[QUI]SDSYMBC("DEGRE",5,4)=X ^%ENVIRON("SD","CERCLE")
 ;;^[QUI]SDSYMBC("DIAMETRE",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("DIAMETRE",5,1)=S AD=14
 ;;^[QUI]SDSYMBC("DIAMETRE",5,2)=S OD=13
 ;;^[QUI]SDSYMBC("DIAMETRE",5,3)=S R=$$DISTANCE^%PBCACV(14,13,19,13)
 ;;^[QUI]SDSYMBC("DIAMETRE",5,4)=X ^%ENVIRON("SD","CERCLE")
 ;;^[QUI]SDSYMBC("DIAMETRE",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("DIAMETRE",6,1)=S AD=4
 ;;^[QUI]SDSYMBC("DIAMETRE",6,2)=S OD=4
 ;;^[QUI]SDSYMBC("DIAMETRE",6,3)=S AA=23
 ;;^[QUI]SDSYMBC("DIAMETRE",6,4)=S OA=23
 ;;^[QUI]SDSYMBC("DIAMETRE",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("E",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("E",1,1)=S AD=0
 ;;^[QUI]SDSYMBC("E",1,2)=S OD=-0
 ;;^[QUI]SDSYMBC("E",1,3)=S AA=0
 ;;^[QUI]SDSYMBC("E",1,4)=S OA=26
 ;;^[QUI]SDSYMBC("E",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("E",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("E",2,1)=S AD=0
 ;;^[QUI]SDSYMBC("E",2,2)=S OD=26
 ;;^[QUI]SDSYMBC("E",2,3)=S AA=27
 ;;^[QUI]SDSYMBC("E",2,4)=S OA=26
 ;;^[QUI]SDSYMBC("E",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("E",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("E",4,1)=S AD=27
 ;;^[QUI]SDSYMBC("E",4,2)=S OD=-0
 ;;^[QUI]SDSYMBC("E",4,3)=S AA=0
 ;;^[QUI]SDSYMBC("E",4,4)=S OA=-0
 ;;^[QUI]SDSYMBC("E",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("E",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("E",5,1)=S AD=0
 ;;^[QUI]SDSYMBC("E",5,2)=S OD=13
 ;;^[QUI]SDSYMBC("E",5,3)=S AA=14
 ;;^[QUI]SDSYMBC("E",5,4)=S OA=13
 ;;^[QUI]SDSYMBC("E",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("F",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("F",1,1)=S AD=0
 ;;^[QUI]SDSYMBC("F",1,2)=S OD=-0
 ;;^[QUI]SDSYMBC("F",1,3)=S AA=0
 ;;^[QUI]SDSYMBC("F",1,4)=S OA=26
 ;;^[QUI]SDSYMBC("F",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("F",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("F",2,1)=S AD=0
 ;;^[QUI]SDSYMBC("F",2,2)=S OD=26
 ;;^[QUI]SDSYMBC("F",2,3)=S AA=27
 ;;^[QUI]SDSYMBC("F",2,4)=S OA=26
 ;;^[QUI]SDSYMBC("F",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("F",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("F",5,1)=S AD=0
 ;;^[QUI]SDSYMBC("F",5,2)=S OD=13
 ;;^[QUI]SDSYMBC("F",5,3)=S AA=14
 ;;^[QUI]SDSYMBC("F",5,4)=S OA=13
 ;;^[QUI]SDSYMBC("F",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("G",7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("G",7,1)=S AD=27
 ;;^[QUI]SDSYMBC("G",7,2)=S OD=13
 ;;^[QUI]SDSYMBC("G",7,3)=S AA=14
 ;;^[QUI]SDSYMBC("G",7,4)=S OA=13
 ;;^[QUI]SDSYMBC("G",7,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("G",8,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("G",8,1)=S AD=27
 ;;^[QUI]SDSYMBC("G",8,2)=S OD=13
 ;;^[QUI]SDSYMBC("G",8,3)=S AA=27
 ;;^[QUI]SDSYMBC("G",8,4)=S OA=6
 ;;^[QUI]SDSYMBC("G",8,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("G",9,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("G",9,1)=S AD=27

