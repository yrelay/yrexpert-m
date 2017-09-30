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
;! Nomprog     : %SGPDIN2                                                     !
;! Module      : Sauvegarde (SG)                                              !
;! But         : Gestions des entrées (IN)                                    !
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

%SGPDIN2 ;
 
 
 
 
 
 
 
 
 
RESTDON(FICHIER,MODEREST,MODECRAS) 
 N RENOMAGE,NOM,MSG,REP,ATT,ORDL
 N INDS,INDD,LIEN,REPS,REPD,CTR,ORD
 N COMM1,COMM2,COMM3,COMM4,COMM5,COMM6,COMM7,%I
 N RENOMIND,BIDON,SEP,NUMIO,OKOPEN,LIGNE,RES,REPLIEN,STATUSFICH,IND
 N AFFEC,TYPAT
 
 S BIDON=$$TEMP^%SGUTIL,RENOMIND=$$TEMP^%SGUTIL
 
 S REPLIEN=$$LIENI^%QSGEL3
 
 S SEP="^"
 
 
 D OPENFILE^%SYSUTI1(FICHIER,"R",.NUMIO,.OKOPEN) G:'(OKOPEN) FIN
 
 F %I=1:1 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) Q:LIGNE=""
 
 S LIGNE=""
LECTBIND 
 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) G:'(STATUSFICH) FIN
 G:LIGNE="" LECTBILN
 
 S REP=$P(LIGNE,SEP,1),IND=$P(LIGNE,SEP,2),REPEXT=$$NOMLOG^%QSF(REP)
 G:'(MODEREST) CREERIND
 
 I $$RANG^%QSGES17(REP)<2 G RENOM
 S NOMPERE=$$NOMASC^%QSGES10(REP,IND,1),REPERE=$$RPERE^%QSGES17(REP)
 S RENOMPERE=@RENOMIND@(REPERE,NOMPERE)
 S NOMFILS=$P(IND,",",$L(IND,","))
 U 0
 D CLEPAG^%VVIDEO
 D ^%VZCD0($$^%QZCHW("Nom de renomage"))
 S DX=2,DY=12 X XY W "de l'individu : "_NOMFILS
 S DY=14 X XY W "du repertoire : "_REPEXT
 D LIRE2^%VREAD("Nom : ","",1,78,17,15,"","",.CTR,.NOM)
 S NOM=RENOMPERE_","_NOM
 G RENOM2
RENOM U 0
 D CLEPAG^%VVIDEO
 D ^%VZCD0($$^%QZCHW("Nom de renomage"))
 S DX=2,DY=12 X XY W "de l'individu : "_IND
 S DY=14 X XY W "du repertoire : "_REPEXT
 D LIRE2^%VREAD("Nom : ",IND,1,78,17,15,"","",.CTR,.NOM)
 G:IND=NOM CREERIND
RENOM2 S @RENOMIND@(REP,IND)=NOM,IND=NOM
CREERIND 
 S AFFEC=1
 I '($$IR^%QSGE5(REP,IND)) S RES=$$CREER^%QSGEIND(REP,IND,$P(LIGNE,SEP,3),1,.MSG) G LECTATTI
 I MODECRAS=2 D SX^%QSGESTK(REP,IND) S RES=$$CREER^%QSGEIND(REP,IND,$P(LIGNE,SEP,3),1,.MSG) G LECTATTI
 I MODECRAS=3 S AFFEC=0 G LECTATTI
 G:MODECRAS=4 LECTATTI
 U 0 S AFFEC=$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression des anciens attributs de")_" "_IND_" ? ")=1 I AFFEC D SX^%QSGESTK(REP,IND) S RES=$$CREER^%QSGEIND(REP,IND,$P(LIGNE,SEP,3),1,.MSG) G LECTATTI
 
 
LECTATTI 
 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) G:'(STATUSFICH) FIN
 G:LIGNE="" LECTBIND
 
 S ATT=$P(LIGNE,SEP,1),ORD=$P(LIGNE,SEP,2)
 I $$TYPEASP^%QMCPZ(WHOIS,QUI,REP,ATT)="TEXTE" D LECTNOTE(REP,IND,ORD)
 D:AFFEC PA^%QSGESTI(REP,IND,ATT,$P(LIGNE,SEP,3),ORD)
 G LECTATTI
 
 
 
 
 
 
LECTBILN 
 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH)
 G:'(STATUSFICH) FIN
 G:(LIGNE'="")&('($F(LIGNE,"^"))) LECTMLX2
LECTILN 
 G:'(STATUSFICH) FIN
 G:LIGNE="" LECTMLX
 
 S REPS=$P(LIGNE,SEP,1),INDS=$P(LIGNE,SEP,2),LIEN=$P(LIGNE,SEP,3)
 S INDD=$P(LIGNE,SEP,4),REPD=$P(LIGNE,SEP,5),ORDL=$P(LIGNE,SEP,6)
 G:'(MODEREST) TESTYPAT
 I $D(@RENOMIND@(REPS,INDS)) S INDS=@RENOMIND@(REPS,INDS)
 I $D(@RENOMIND@(REPD,INDD)) S INDD=@RENOMIND@(REPD,INDD)
TESTYPAT 
 
 S TYPAT=$$TYPE2^%QSGEST9(REPS,LIEN)
 G:(TYPAT=2)!(TYPAT=1) NOMINDLN
 I TYPAT=0 S IND="" G LECTATTL
 
 G:$$IR^%QSGE5(REPD,INDD) LIAISON
 S RES=$$CREER^%QSGEIND(REPD,INDD,"",1,.MSG)
 I RES F %J=0:0 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) G:'(STATUSFICH) FIN I LIGNE="" S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) G LECTILN
 
LIAISON 
 
 I $$OVAIR^%QSGE5(REPS,INDS,LIEN,INDD,ORDL)'=1 D ADDS^%QSGES26(REPS,INDS,LIEN,REPD,INDD)
NOMINDLN 
 S IND=$$NOML1^%QSGES20(INDS,ORDL,LIEN,INDD)
 
LECTATTL 
 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) G:'(STATUSFICH) FIN
 I LIGNE="" S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) G LECTILN
 
 D PA^%QSGESTI(REPLIEN,IND,$P(LIGNE,SEP,1),$P(LIGNE,SEP,3),$P(LIGNE,SEP,2))
 G LECTATTL
 
 
 
LECTMLX 
 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH)
 G:'(STATUSFICH) FIN
 G:LIGNE="" FIN
LECTMLX2 
 
 F %I=1:1:7 S @("COMM"_%I)=$$READ^%SYSUTI1(NUMIO,.STATUSFICH)
 I '($$EXIST^%LXSTOCK(LIGNE)) D STOCK^%LXAJMOD(LIGNE,COMM1,COMM2,COMM3,COMM4,COMM5,COMM6,COMM7,BIDON)
 G LECTMLX
 
 
FIN D CLOSE^%SYSUTI1(NUMIO,"R")
 K @(BIDON),@(RENOMIND)
 Q
 
LECTNOTE(R,I,O) 
 N LGN,NLGN
 S LGN=""
 F NLGN=1:1 S LGN=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) Q:LGN=""  S ^[QUI]QUERYT(R,I,O,"LIGNE",NLGN)=LGN
 D PARAM^%QSNOTE3(R,I,O)
 Q
 ;

