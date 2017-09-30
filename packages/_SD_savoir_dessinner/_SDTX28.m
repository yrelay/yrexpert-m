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

;%SDTX28^INT^1^59547,73890^0
SDTX28 ;;
 ;;^[QUI]SDSYMBC("B",1,3)=S AA=0
 ;;^[QUI]SDSYMBC("B",1,4)=S OA=26
 ;;^[QUI]SDSYMBC("B",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("B",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("B",2,1)=S AD=0
 ;;^[QUI]SDSYMBC("B",2,2)=S OD=27
 ;;^[QUI]SDSYMBC("B",2,3)=S AA=14
 ;;^[QUI]SDSYMBC("B",2,4)=S OA=27
 ;;^[QUI]SDSYMBC("B",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("B",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("B",3,1)=S AD=14
 ;;^[QUI]SDSYMBC("B",3,2)=S OD=27
 ;;^[QUI]SDSYMBC("B",3,3)=S AA=19
 ;;^[QUI]SDSYMBC("B",3,4)=S OA=23
 ;;^[QUI]SDSYMBC("B",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("B",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("B",4,1)=S AD=19
 ;;^[QUI]SDSYMBC("B",4,2)=S OD=23
 ;;^[QUI]SDSYMBC("B",4,3)=S AA=19
 ;;^[QUI]SDSYMBC("B",4,4)=S OA=17
 ;;^[QUI]SDSYMBC("B",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("B",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("B",5,1)=S AD=19
 ;;^[QUI]SDSYMBC("B",5,2)=S OD=17
 ;;^[QUI]SDSYMBC("B",5,3)=S AA=14
 ;;^[QUI]SDSYMBC("B",5,4)=S OA=13
 ;;^[QUI]SDSYMBC("B",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("B",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("B",6,1)=S AD=0
 ;;^[QUI]SDSYMBC("B",6,2)=S OD=13
 ;;^[QUI]SDSYMBC("B",6,3)=S AA=21
 ;;^[QUI]SDSYMBC("B",6,4)=S OA=13
 ;;^[QUI]SDSYMBC("B",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("B",7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("B",7,1)=S AD=21
 ;;^[QUI]SDSYMBC("B",7,2)=S OD=13
 ;;^[QUI]SDSYMBC("B",7,3)=S AA=27
 ;;^[QUI]SDSYMBC("B",7,4)=S OA=9
 ;;^[QUI]SDSYMBC("B",7,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("B",8,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("B",8,1)=S AD=27
 ;;^[QUI]SDSYMBC("B",8,2)=S OD=9
 ;;^[QUI]SDSYMBC("B",8,3)=S AA=27
 ;;^[QUI]SDSYMBC("B",8,4)=S OA=4
 ;;^[QUI]SDSYMBC("B",8,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("B",9,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("B",9,1)=S AD=27
 ;;^[QUI]SDSYMBC("B",9,2)=S OD=4
 ;;^[QUI]SDSYMBC("B",9,3)=S AA=21
 ;;^[QUI]SDSYMBC("B",9,4)=S OA=-0
 ;;^[QUI]SDSYMBC("B",9,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("B",10,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("B",10,1)=S AD=21
 ;;^[QUI]SDSYMBC("B",10,2)=S OD=-0
 ;;^[QUI]SDSYMBC("B",10,3)=S AA=0
 ;;^[QUI]SDSYMBC("B",10,4)=S OA=-0
 ;;^[QUI]SDSYMBC("B",10,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("C",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("C",1,1)=S AD=27
 ;;^[QUI]SDSYMBC("C",1,2)=S OD=23
 ;;^[QUI]SDSYMBC("C",1,3)=S AA=21
 ;;^[QUI]SDSYMBC("C",1,4)=S OA=27
 ;;^[QUI]SDSYMBC("C",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("C",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("C",2,1)=S AD=21
 ;;^[QUI]SDSYMBC("C",2,2)=S OD=27
 ;;^[QUI]SDSYMBC("C",2,3)=S AA=6
 ;;^[QUI]SDSYMBC("C",2,4)=S OA=27
 ;;^[QUI]SDSYMBC("C",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("C",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("C",3,1)=S AD=6
 ;;^[QUI]SDSYMBC("C",3,2)=S OD=27
 ;;^[QUI]SDSYMBC("C",3,3)=S AA=0
 ;;^[QUI]SDSYMBC("C",3,4)=S OA=21
 ;;^[QUI]SDSYMBC("C",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("C",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("C",4,1)=S AD=0
 ;;^[QUI]SDSYMBC("C",4,2)=S OD=21
 ;;^[QUI]SDSYMBC("C",4,3)=S AA=0
 ;;^[QUI]SDSYMBC("C",4,4)=S OA=6
 ;;^[QUI]SDSYMBC("C",4,5)=X ^%ENVIRON("SD","TRAIT")

