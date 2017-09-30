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

;%SDTX27^INT^1^59547,73890^0
SDTX27 ;;
 ;;^[QUI]SDSYMBC(")",1,1)=S AD=14
 ;;^[QUI]SDSYMBC(")",1,2)=S OD=-0
 ;;^[QUI]SDSYMBC(")",1,3)=S R=$$DISTANCE^%PBCACV(14,-0,6,13)
 ;;^[QUI]SDSYMBC(")",1,4)=S ID=$$ANGLE^%PBCACV(14,-0,14,27)
 ;;^[QUI]SDSYMBC(")",1,5)=S IF=$$ANGLE^%PBCACV(14,-0,6,13)
 ;;^[QUI]SDSYMBC(")",1,6)=X ^%ENVIRON("SD","ARC")
 ;;^[QUI]SDSYMBC("*",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("*",1,1)=S AD=14
 ;;^[QUI]SDSYMBC("*",1,2)=S OD=8
 ;;^[QUI]SDSYMBC("*",1,3)=S AA=14
 ;;^[QUI]SDSYMBC("*",1,4)=S OA=19
 ;;^[QUI]SDSYMBC("*",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("*",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("*",2,1)=S AD=8
 ;;^[QUI]SDSYMBC("*",2,2)=S OD=8
 ;;^[QUI]SDSYMBC("*",2,3)=S AA=19
 ;;^[QUI]SDSYMBC("*",2,4)=S OA=19
 ;;^[QUI]SDSYMBC("*",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("*",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("*",3,1)=S AD=19
 ;;^[QUI]SDSYMBC("*",3,2)=S OD=8
 ;;^[QUI]SDSYMBC("*",3,3)=S AA=8
 ;;^[QUI]SDSYMBC("*",3,4)=S OA=19
 ;;^[QUI]SDSYMBC("*",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("+",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("+",1,1)=S AD=8
 ;;^[QUI]SDSYMBC("+",1,2)=S OD=13
 ;;^[QUI]SDSYMBC("+",1,3)=S AA=19
 ;;^[QUI]SDSYMBC("+",1,4)=S OA=13
 ;;^[QUI]SDSYMBC("+",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("+",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("+",2,1)=S AD=14
 ;;^[QUI]SDSYMBC("+",2,2)=S OD=8
 ;;^[QUI]SDSYMBC("+",2,3)=S AA=14
 ;;^[QUI]SDSYMBC("+",2,4)=S OA=19
 ;;^[QUI]SDSYMBC("+",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("-",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("-",1,1)=S AD=8
 ;;^[QUI]SDSYMBC("-",1,2)=S OD=13
 ;;^[QUI]SDSYMBC("-",1,3)=S AA=19
 ;;^[QUI]SDSYMBC("-",1,4)=S OA=13
 ;;^[QUI]SDSYMBC("-",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("/",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("/",1,1)=S AD=8
 ;;^[QUI]SDSYMBC("/",1,2)=S OD=-0
 ;;^[QUI]SDSYMBC("/",1,3)=S AA=19
 ;;^[QUI]SDSYMBC("/",1,4)=S OA=27
 ;;^[QUI]SDSYMBC("/",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("=",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("=",1,1)=S AD=8
 ;;^[QUI]SDSYMBC("=",1,2)=S OD=15
 ;;^[QUI]SDSYMBC("=",1,3)=S AA=19
 ;;^[QUI]SDSYMBC("=",1,4)=S OA=15
 ;;^[QUI]SDSYMBC("=",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("=",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("=",2,1)=S AD=19
 ;;^[QUI]SDSYMBC("=",2,2)=S OD=9
 ;;^[QUI]SDSYMBC("=",2,3)=S AA=8
 ;;^[QUI]SDSYMBC("=",2,4)=S OA=9
 ;;^[QUI]SDSYMBC("=",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("A",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("A",5,1)=S AD=0
 ;;^[QUI]SDSYMBC("A",5,2)=S OD=-0
 ;;^[QUI]SDSYMBC("A",5,3)=S AA=14
 ;;^[QUI]SDSYMBC("A",5,4)=S OA=26
 ;;^[QUI]SDSYMBC("A",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("A",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("A",6,1)=S AD=14
 ;;^[QUI]SDSYMBC("A",6,2)=S OD=26
 ;;^[QUI]SDSYMBC("A",6,3)=S AA=27
 ;;^[QUI]SDSYMBC("A",6,4)=S OA=-0
 ;;^[QUI]SDSYMBC("A",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("A",7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("A",7,1)=S AD=7
 ;;^[QUI]SDSYMBC("A",7,2)=S OD=13
 ;;^[QUI]SDSYMBC("A",7,3)=S AA=20
 ;;^[QUI]SDSYMBC("A",7,4)=S OA=13
 ;;^[QUI]SDSYMBC("A",7,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("B",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("B",1,1)=S AD=0
 ;;^[QUI]SDSYMBC("B",1,2)=S OD=-0

