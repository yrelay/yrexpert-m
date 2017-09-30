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

;%QNEQPR1^INT^1^59547,73879^0
QNEQPR1(ETU,PORT,TERM) 
 
 
 
 
 
 
 
 
 
 N RETU,CATT,LLISTEN,MSG,ENT,NOMEN,PAS,MIN,MAX,LISTIND,GAM,OUT,REPG
 S RETU=$$REP^%QNEQETU
 S CATT=$$^%QSCALVA(RETU,ETU,"ATTRIBUT.CAPACITE")
 S LLISTEN=$$^%QSCALVA(RETU,ETU,"LISTE.POSTES")
 S ENT=$$^%QSCALVA(RETU,ETU,"ENTREPRISE")
 S LISTIND=$$^%QSCALVA(RETU,ETU,"LISTE.OPERATIONS.GAMME")
 S GAM=$$^%QSCALVA(RETU,ETU,"NOM.GAMME")
 S REPG=$$^%QSCALVA(RETU,ETU,"REPERTOIRE.GAMME")
 I $$TEST^%QNEQPRS(GAM,LISTIND,LLISTEN)=0 Q
 
 S NOMEN=$S($$^%QSCALVA(RETU,ETU,"IMPRESSION.AVEC.NOMENCLATURE")="OUI":1,1:0)
 S OUT=$S($$^%QSCALVA(RETU,ETU,"IMPRESSION.AVEC.OUTILLAGE")="OUI":1,1:0)
 S MSG=$$OPEN^%PBPZPR(PORT,TERM)
 I MSG'="" D ^%VZEAVT(MSG) Q
 D RECUP^%QNEQETU(ETU,.REPG,.GAM,.LISTIND,.MSG)
 I MSG'="" D ^%VZEAVT(MSG) Q
 D INIT^%PBPZPR(PORT,TERM)
 
 D PARAM(RETU,ETU,CATT,PORT,TERM)
 
 S MSG=$$RECAPP^%QNEQPR2(RETU,ETU,CATT,LLISTEN,PORT,TERM)
 I MSG'="" D ^%VZEAVT(MSG),FIN Q
 
 D LLISTEN^%QNEQPR4(RETU,ETU,LLISTEN,CATT,ENT,NOMEN,OUT,PORT,TERM)
 D FLUSH^%PBPZPR(PORT,TERM)
 
 D ^%QNEQU12(LLISTEN,"TEMPS.PAR.OPERATEUR","NOM",0,0,0)
 D DISP^%QNEQUI6(LISTIND,CATT,.MIN,.MAX,.PAS)
 D ^%QNEQU12(LISTIND,"UNITE.DE.COMPTE",CATT,1,PAS,0)
 D CLOSE^%PBPZPR(PORT,TERM)
 Q
 
FIN D FLUSH^%PBPZPR(PORT,TERM)
 D CLOSE^%PBPZPR(PORT,TERM)
 Q
 
PARAM(RETU,ETU,CATT,PORT,TERM) 
 N EPA,TAILLE,L,H,PAS,TAILLE1
 
 S EPA=5E-1
 
 S TAILLE=10
 
 S L=1
 
 S H=1
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,7*L,1*H,$$^%QZCHW("EQUILIBRAGE"))
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,12*L,1*H,ETU)
 D HACHURER^%PBPZPR(PORT,TERM,EPA,68E-1*L,5E-1*H,9*L,5E-1*H)
 
 S TAILLE=11
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,3*L,2*H,$$^%QZCHW("Entreprise")_" :")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,6*L,2*H,$$^%QSCALVA(RETU,ETU,"ENTREPRISE"))
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,10*L,2*H,$$^%QZCHW("Gamme")_" : "_$$^%QSCALVA(RETU,ETU,"NOM.GAMME"))
 
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,3*H,20*L,3*H)
 S TAILLE=4,TAILLE1=3
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,1*L,4*H,$$^%QZCHW("Commentaire")_" : ")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,4*L,4*H,$$^%QSCALVA(RETU,ETU,"COMMENTAIRE"))
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,1*L,5*H,$$^%QZCHW("Liste d'entr{e")_" :")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,4*L,5*H,$$^%QSCALVA(RETU,ETU,"LISTE.OPERATIONS.GAMME"))
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,12*L,5*H,$$^%QZCHW("Equilibre")_" :")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,16*L,5*H,$J($$^%QSCALIN(RETU,ETU,"EQUILIBRE.REEL",CATT),3,2)_" %")
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,1*L,6*H,$$^%QZCHW("Date")_" :")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,4*L,6*H,$$3^%QMDATE1)
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,12*L,6*H,$$^%QZCHW("Cycle")_" : ")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,16*L,6*H,$$^%QSCALIN(RETU,ETU,"CYCLE.REEL",CATT))
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,1*L,7*H,$$^%QZCHW("Attribut")_" : ")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,4*L,7*H,CATT)
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,12*L,7*H,$$^%QZCHW("Concession Maximum")_" : ")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,16*L,7*H,$J($$^%QSCALIN(RETU,ETU,"CONCESSION.MAXIMUM",CATT),3,2)_" %")
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,1*L,8*H,$$^%QZCHW("T.A.L")_" :")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,4*L,8*H,$$^%QSCALVA(RETU,ETU,"TRAITEMENT.ACCEPTATION.LOCAL"))
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,12*L,8*H,$$^%QZCHW("T.A.G")_" :")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,16*L,8*H,$$^%QSCALVA(RETU,ETU,"TRAITEMENT.ACCEPTATION.GLOBAL"))
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,1*L,9*H,$$^%QZCHW("Ins{parables")_" :")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,4*L,9*H,$$^%QSCALVA(RETU,ETU,"LISTE.GROUPES.INSEPARABLES"))
 
 D PLACER^%PBPZPR(PORT,TERM,TAILLE,12*L,9*H,$$^%QZCHW("Incompatibles")_" :")
 D PLACER^%PBPZPR(PORT,TERM,TAILLE1,16*L,9*H,$$^%QSCALVA(RETU,ETU,"LISTE.GROUPES.INCOMPATIBLES"))
 
 D TRAIT^%PBPZPR(PORT,TERM,EPA,0*L,11*H,20*L,11*H)
 
 D PLACER^%PBPZPR(PORT,TERM,3,14*L,28*H,$$^%QZCHW("Edite par M.W.M le")_$$3^%QMDATE1)
 Q
 
TEST X ^DOTS D ^%QNEQPR1("EQX88120073",74,0)
 Q
TEST2 X ^DOTS D ^%QNEQPR1("EQX88120074",74,0)
 Q
TEST3 X ^DMO D ^%QNEQPR1("EQX88120001",74,1)
 Q
TEST1 S PORT=74,TERM="KYO"
 S MSG=$$OPEN^%PBPZPR(PORT,TERM)
 I MSG'="" D ^%VZEAVT(MSG) Q
 D INIT^%PBPZPR(PORT,TERM)
 D TRAIT^%PBPZPR(PORT,TERM,5E-1,5,10,15,10)
 D CLEAR^%PBPZPR(PORT,TERM)
 D FLUSH^%PBPZPR(PORT,TERM)
 D CLOSE^%PBPZPR(PORT,TERM)
 Q

