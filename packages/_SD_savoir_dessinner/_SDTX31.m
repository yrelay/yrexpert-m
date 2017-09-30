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

;%SDTX31^INT^1^59547,73890^0
SDTX31 ;;
 ;;^[QUI]SDSYMBC("G",9,2)=S OD=6
 ;;^[QUI]SDSYMBC("G",9,3)=S AA=21
 ;;^[QUI]SDSYMBC("G",9,4)=S OA=-0
 ;;^[QUI]SDSYMBC("G",9,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("G",10,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("G",10,1)=S AD=21
 ;;^[QUI]SDSYMBC("G",10,2)=S OD=-0
 ;;^[QUI]SDSYMBC("G",10,3)=S AA=6
 ;;^[QUI]SDSYMBC("G",10,4)=S OA=-0
 ;;^[QUI]SDSYMBC("G",10,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("G",11,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("G",11,1)=S AD=6
 ;;^[QUI]SDSYMBC("G",11,2)=S OD=-0
 ;;^[QUI]SDSYMBC("G",11,3)=S AA=0
 ;;^[QUI]SDSYMBC("G",11,4)=S OA=6
 ;;^[QUI]SDSYMBC("G",11,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("G",12,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("G",12,1)=S AD=0
 ;;^[QUI]SDSYMBC("G",12,2)=S OD=6
 ;;^[QUI]SDSYMBC("G",12,3)=S AA=0
 ;;^[QUI]SDSYMBC("G",12,4)=S OA=21
 ;;^[QUI]SDSYMBC("G",12,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("G",13,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("G",13,1)=S AD=0
 ;;^[QUI]SDSYMBC("G",13,2)=S OD=21
 ;;^[QUI]SDSYMBC("G",13,3)=S AA=6
 ;;^[QUI]SDSYMBC("G",13,4)=S OA=27
 ;;^[QUI]SDSYMBC("G",13,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("G",14,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("G",14,1)=S AD=6
 ;;^[QUI]SDSYMBC("G",14,2)=S OD=27
 ;;^[QUI]SDSYMBC("G",14,3)=S AA=27
 ;;^[QUI]SDSYMBC("G",14,4)=S OA=27
 ;;^[QUI]SDSYMBC("G",14,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("H",1,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("H",1,1)=S AD=0
 ;;^[QUI]SDSYMBC("H",1,2)=S OD=-0
 ;;^[QUI]SDSYMBC("H",1,3)=S AA=0
 ;;^[QUI]SDSYMBC("H",1,4)=S OA=26
 ;;^[QUI]SDSYMBC("H",1,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("H",3,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("H",3,1)=S AD=27
 ;;^[QUI]SDSYMBC("H",3,2)=S OD=26
 ;;^[QUI]SDSYMBC("H",3,3)=S AA=27
 ;;^[QUI]SDSYMBC("H",3,4)=S OA=-0
 ;;^[QUI]SDSYMBC("H",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("H",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("H",5,1)=S AD=0
 ;;^[QUI]SDSYMBC("H",5,2)=S OD=13
 ;;^[QUI]SDSYMBC("H",5,3)=S AA=27
 ;;^[QUI]SDSYMBC("H",5,4)=S OA=13
 ;;^[QUI]SDSYMBC("H",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("I",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("I",5,1)=S AD=14
 ;;^[QUI]SDSYMBC("I",5,2)=S OD=26
 ;;^[QUI]SDSYMBC("I",5,3)=S AA=14
 ;;^[QUI]SDSYMBC("I",5,4)=S OA=-0
 ;;^[QUI]SDSYMBC("I",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("I",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("I",6,1)=S AD=8
 ;;^[QUI]SDSYMBC("I",6,2)=S OD=-0
 ;;^[QUI]SDSYMBC("I",6,3)=S AA=19
 ;;^[QUI]SDSYMBC("I",6,4)=S OA=-0
 ;;^[QUI]SDSYMBC("I",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("I",7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("I",7,1)=S AD=8
 ;;^[QUI]SDSYMBC("I",7,2)=S OD=26
 ;;^[QUI]SDSYMBC("I",7,3)=S AA=19
 ;;^[QUI]SDSYMBC("I",7,4)=S OA=26
 ;;^[QUI]SDSYMBC("I",7,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("J",7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("J",7,1)=S AD=8
 ;;^[QUI]SDSYMBC("J",7,2)=S OD=26
 ;;^[QUI]SDSYMBC("J",7,3)=S AA=19
 ;;^[QUI]SDSYMBC("J",7,4)=S OA=26
 ;;^[QUI]SDSYMBC("J",7,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("J",9,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("J",9,1)=S AD=14
 ;;^[QUI]SDSYMBC("J",9,2)=S OD=5
 ;;^[QUI]SDSYMBC("J",9,3)=S AA=14
 ;;^[QUI]SDSYMBC("J",9,4)=S OA=26

