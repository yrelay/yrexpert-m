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

;%SDTX36^INT^1^59547,73890^0
SDTX36 ;;
 ;;^[QUI]SDSYMBC("S",3,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("S",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("S",4,1)=S AD=27
 ;;^[QUI]SDSYMBC("S",4,2)=S OD=4
 ;;^[QUI]SDSYMBC("S",4,3)=S AA=27
 ;;^[QUI]SDSYMBC("S",4,4)=S OA=9
 ;;^[QUI]SDSYMBC("S",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("S",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("S",5,1)=S AD=27
 ;;^[QUI]SDSYMBC("S",5,2)=S OD=9
 ;;^[QUI]SDSYMBC("S",5,3)=S AA=23
 ;;^[QUI]SDSYMBC("S",5,4)=S OA=13
 ;;^[QUI]SDSYMBC("S",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("S",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("S",6,1)=S AD=23
 ;;^[QUI]SDSYMBC("S",6,2)=S OD=13
 ;;^[QUI]SDSYMBC("S",6,3)=S AA=4
 ;;^[QUI]SDSYMBC("S",6,4)=S OA=13
 ;;^[QUI]SDSYMBC("S",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("S",7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("S",7,1)=S AD=4
 ;;^[QUI]SDSYMBC("S",7,2)=S OD=13
 ;;^[QUI]SDSYMBC("S",7,3)=S AA=0
 ;;^[QUI]SDSYMBC("S",7,4)=S OA=17
 ;;^[QUI]SDSYMBC("S",7,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("S",8,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("S",8,1)=S AD=0
 ;;^[QUI]SDSYMBC("S",8,2)=S OD=17
 ;;^[QUI]SDSYMBC("S",8,3)=S AA=0
 ;;^[QUI]SDSYMBC("S",8,4)=S OA=23
 ;;^[QUI]SDSYMBC("S",8,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("S",9,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("S",9,1)=S AD=0
 ;;^[QUI]SDSYMBC("S",9,2)=S OD=23
 ;;^[QUI]SDSYMBC("S",9,3)=S AA=4
 ;;^[QUI]SDSYMBC("S",9,4)=S OA=27
 ;;^[QUI]SDSYMBC("S",9,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("S",10,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("S",10,1)=S AD=4
 ;;^[QUI]SDSYMBC("S",10,2)=S OD=27
 ;;^[QUI]SDSYMBC("S",10,3)=S AA=23
 ;;^[QUI]SDSYMBC("S",10,4)=S OA=27
 ;;^[QUI]SDSYMBC("S",10,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("S",11,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("S",11,1)=S AD=23
 ;;^[QUI]SDSYMBC("S",11,2)=S OD=27
 ;;^[QUI]SDSYMBC("S",11,3)=S AA=27
 ;;^[QUI]SDSYMBC("S",11,4)=S OA=23
 ;;^[QUI]SDSYMBC("S",11,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("SIGMA",2,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("SIGMA",2,1)=S AD=0
 ;;^[QUI]SDSYMBC("SIGMA",2,2)=S OD=53
 ;;^[QUI]SDSYMBC("SIGMA",2,3)=S AA=54
 ;;^[QUI]SDSYMBC("SIGMA",2,4)=S OA=53
 ;;^[QUI]SDSYMBC("SIGMA",2,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("SIGMA",4,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("SIGMA",4,1)=S AD=54
 ;;^[QUI]SDSYMBC("SIGMA",4,2)=S OD=-0
 ;;^[QUI]SDSYMBC("SIGMA",4,3)=S AA=0
 ;;^[QUI]SDSYMBC("SIGMA",4,4)=S OA=-0
 ;;^[QUI]SDSYMBC("SIGMA",4,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("SIGMA",5,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("SIGMA",5,1)=S AD=0
 ;;^[QUI]SDSYMBC("SIGMA",5,2)=S OD=-1
 ;;^[QUI]SDSYMBC("SIGMA",5,3)=S AA=27
 ;;^[QUI]SDSYMBC("SIGMA",5,4)=S OA=26
 ;;^[QUI]SDSYMBC("SIGMA",5,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("SIGMA",6,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("SIGMA",6,1)=S AD=27
 ;;^[QUI]SDSYMBC("SIGMA",6,2)=S OD=26
 ;;^[QUI]SDSYMBC("SIGMA",6,3)=S AA=0
 ;;^[QUI]SDSYMBC("SIGMA",6,4)=S OA=53
 ;;^[QUI]SDSYMBC("SIGMA",6,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("SIGMA",7,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("SIGMA",7,1)=S AD=54
 ;;^[QUI]SDSYMBC("SIGMA",7,2)=S OD=53
 ;;^[QUI]SDSYMBC("SIGMA",7,3)=S AA=54
 ;;^[QUI]SDSYMBC("SIGMA",7,4)=S OA=45
 ;;^[QUI]SDSYMBC("SIGMA",7,5)=X ^%ENVIRON("SD","TRAIT")
 ;;^[QUI]SDSYMBC("SIGMA",8,0)=S EPAISSEUR=1,TRAIT="NORMAL"
 ;;^[QUI]SDSYMBC("SIGMA",8,1)=S AD=54

